//! # Test cases
//!

use super::*;
use crate::mpmc::*;
use crate::thoughts::wakeable::*;
use alloc::boxed::Box;
use alloc::sync::Arc;
use assert_matches::*;
use core::pin::Pin;
use ruspiro_lock::DataLock;

struct Task {
    thought: DataLock<Option<Pin<Box<dyn Thought<Output = ()> + 'static + Send>>>>,
    sender: Sender<Arc<Self>>,
}

impl WakeAble for Task {
    fn wake_by_ref(arc_self: &Arc<Self>) {
        println!("wake task..., refcount: {}", Arc::strong_count(arc_self));
        let cloned_task = arc_self.clone();
        arc_self.sender.send(cloned_task);
        println!(
            "send woken task to sender, refcount: {}",
            Arc::strong_count(arc_self)
        );
    }
}

struct CountingThought {
    counter: DataLock<u32>,
    ready_count: u32,
}

impl Thought for CountingThought {
    type Output = ();

    fn think(self: Pin<&mut Self>, ctx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let mut count = self.counter.try_lock().unwrap();
        *count += 1;
        println!("current count: {}", *count);
        if *count >= self.ready_count {
            Conclusion::Ready(())
        } else {
            ctx.waker().wake_by_ref();
            println!("need to rethink this, count to low");
            Conclusion::Pending
        }
    }
}

#[test]
fn spawn_task_to_channel() {
    let (tx, rx) = channel();
    let some_thought = CountingThought {
        counter: DataLock::new(0),
        ready_count: 1,
    };
    let task = Arc::new(Task {
        thought: DataLock::new(Some(some_thought.boxed())),
        sender: tx.clone(),
    });

    tx.send(task.clone());
    let work_task = rx.recv().unwrap();
    let mut thought_slot = work_task.thought.try_lock().unwrap();
    assert!(thought_slot.is_some());
    if let Some(mut thought) = thought_slot.take() {
        let waker = waker_ref_from_wakeable(&work_task);
        let ctx = &mut Context::from_waker(&*waker);
        assert_matches!(thought.as_mut().think(ctx), Conclusion::Ready(_));
    }
    drop(thought_slot);
    assert!(task.thought.try_lock().unwrap().is_none());
}

#[test]
fn respawn_task_to_channel() {
    // create the channel (queue) of tasks to be processed
    let (tx, rx) = channel();
    // create a thought the task should progress
    let some_thought = CountingThought {
        counter: DataLock::new(0),
        ready_count: 5,
    };
    // create the task
    let task = Arc::new(Task {
        thought: DataLock::new(Some(some_thought.boxed())),
        sender: tx.clone(),
    });
    // push the task to the processing queue
    tx.send(task);

    // pull tasks from the processing queue as long as they exist
    while let Ok(work_task) = rx.recv() {
        println!(
            "received task to process, refcount to task {}",
            Arc::strong_count(&work_task)
        );
        // get the thought the task is ownling
        let mut thought_slot = work_task.thought.try_lock().unwrap();
        assert!(thought_slot.is_some());
        // if the thought is still able to make progress
        if let Some(mut thought) = thought_slot.take() {
            println!("prepare thinking");
            // create the waker will be able to wake this specific task
            let waker = waker_ref_from_wakeable(&work_task);
            // create the context for thinking from this waker
            let ctx = &mut Context::from_waker(&*waker);
            // if thinking returns Conclusion::Pending we need to put the
            // thought back to the task. The waker passed to the thinking will
            // wake the thought and send it back to the processing queue whenever appropriate
            println!("think...");
            if let Conclusion::Pending = thought.as_mut().think(ctx) {
                println!(
                    "conclusion pending..., refcount to task {}",
                    Arc::strong_count(&work_task)
                );
                *thought_slot = Some(thought);
                println!("thought re-assigned to task");
            } else {
                println!("...done");
            }
        }
        println!(
            "after thinking, refcount to task {}",
            Arc::strong_count(&work_task)
        );
    }
}
