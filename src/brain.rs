/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # The Brain
//!
//!

use crate::alloc::sync::Arc;
use crate::mpmc::*;
use crate::thoughts::{*, wakeable::waker_ref_from_wakeable};
use ruspiro_lock::DataLock;

pub trait Spawn {
    fn spawn(&self, thinkable: impl Thinkable<Output = ()> + 'static + Send);
}

pub struct Brain {
    sender: Option<Sender<Arc<Thought>>>,
    receiver: Option<Receiver<Arc<Thought>>>,
}

impl Brain {
    /// Create a new intance of the [``Brain``]. As it usually will be used as a [``Singleton``] this
    /// does provide an *uninitialized* ``Brain`` as the ``static`` ``Singleton`` does only allow
    /// ``const fn``s to be used for instantiation. To be usefull the ``initialze`` function need to
    /// be called on the ``Brain`` instance as soon as possible
    pub(crate) const fn new() -> Self {
        Brain {
            sender: None,
            receiver: None,
        }
    }

    #[allow(clippy::must_use_unit)]
    #[must_use]
    pub fn initialize(&mut self) {
        // create a new multi-producer-multi-consumer channel queue that contains all *need-to-think-on*
        // items that could be pushed in and pulled off from any core, preserving the correct order.
        let (tx, rx) = channel();
        self.sender.replace(tx);
        self.receiver.replace(rx);
    }

    /// Let the [``Brain``] think on all [``Thinkable``]s in the *need-to-think-on-queue*. This may spawn new
    /// thinkables to think on. However, if there is nothing left to make progress this funtion will
    /// return. So the *need-to-think-on-queue* is empty. However, there might be ``Thinkable`` woken
    /// from external events (like interrupts) at a later point in time. So ``think`` might need to
    /// be called again, however we might send the current core to *sleep* until such an event happens
    pub fn think(&self) {
        if let Some(ref receiver) = self.receiver {
            // pull a new Thought from the *need-to-think-on-queue*
            while let Ok(thought) = receiver.recv() {
                // check if we can get the Thinkable that is wrapped by this Thought. The only situation this
                // lock could fail is, if this exact ``Thinkable`` has been re-spawned from it's ``Waker``
                // and another core already picked this up while this actual processing has not yet finished.
                // However, it would be fine in this case to wait until the lock on this data has been
                // released and block the actual processing. The alternative would be to put this ``Thinkable``
                // back on the *need-to-think-of-queue* which might cause an even greater delay in processing
                // that is less expected then this short blocking
                let mut thinkable_slot = thought.thinkable.lock();
                if let Some(mut thinkable) = thinkable_slot.take() {
                    // bevore actually thinking on this Thinkable is possible we need to create a ``Context``
                    // that contains the ``Waker`` that is able to re-spawn this ``Thinkable`` in case it's
                    // not already comming to a ``Conclusion::Ready(_)``
                    let waker = waker_ref_from_wakeable(&thought);
                    let ctx = &mut Context::from_waker(&*waker);
                    // now think on this ``Thinkable``
                    if let Conclusion::Pending = thinkable.as_mut().think(ctx) {
                        // thinking does not come to a conclusion yet, so the waker will put a clone of
                        // this task back to the *need-to-think-on-queue*. As we have taken the ``Thought``
                        // out of it's slot, we need to put it back to ensure the ``Task`` when picked up
                        // from it's queue is properly linked to the ``Thinkable`` it should think on.
                        *thinkable_slot = Some(thinkable);
                    }
                }
            }
        }
    }
}

impl Spawn for Brain {
    /// Spawn a new [``Thinkable``] to the [``Brain``}s *need-to-think-on-queue*
    fn spawn(&self, thinkable: impl Thinkable<Output = ()> + 'static + Send) {
        self.sender.as_ref().map(|sender| {
            // first box and pin the Thought to ensure we can savely share it between cores as it's
            // location in memory cannot move
            let thinkable = thinkable.boxed();
            // now crate an async reference counted task on the HEAP that is able to be pushed to the
            // queue containing the ``Thought`` to think on and the spawner to be able to re-spawn this
            // task in case it was not able to make progress in the first attempt of thinkin on it
            let thought = Arc::new(Thought {
                thinkable: DataLock::new(Some(thinkable)),
                spawner: sender.clone(),
            });
            sender.send(thought);
        });
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use core::cell::RefCell;
    use core::pin::Pin;
    use ruspiro_singleton::Singleton;
    use std::thread;

    #[derive(Default)]
    struct TestThought {
        counter: RefCell<u32>,
        ready: u32,
    }

    impl Thinkable for TestThought {
        type Output = ();

        fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
            let mut counter = self.counter.borrow_mut();
            *counter += 1;
            if *counter > self.ready {
                Conclusion::Ready(())
            } else {
                println!("current count: {}", *counter);
                cx.waker().wake_by_ref();
                Conclusion::Pending
            }
        }
    }

    #[test]
    fn create_brain_and_think() {
        let mut brain = Brain::new();
        brain.initialize();

        let thinkable = TestThought::default();
        brain.spawn(thinkable);

        brain.think();
    }

    static BRAIN: Singleton<Brain> = Singleton::new(Brain::new());

    #[test]
    fn create_brain_and_think_multithread() {
        BRAIN.take_for(|brain| brain.initialize());

        for i in 0..5 {
            let thinkable = TestThought {
                counter: RefCell::new(i * 10),
                ready: i * 10 + 5,
            };

            thread::spawn(move || {
                BRAIN.use_for(|brain| brain.spawn(thinkable));
            });

            thread::spawn(move || {
                BRAIN.use_for(|brain| brain.think());
            });
        }

        thread::sleep_ms(1000);
    }

    #[derive(Default)]
    struct FirstThought {
        counter: RefCell<u32>,
        ready: u32,
    }

    impl Thinkable for FirstThought {
        type Output = u32;

        fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
            let mut counter = self.counter.borrow_mut();
            *counter += 1;
            if *counter > self.ready {
                Conclusion::Ready(*counter)
            } else {
                println!("current first count: {}", *counter);
                cx.waker().wake_by_ref();
                Conclusion::Pending
            }
        }
    }

    #[test]
    fn create_brain_and_think_then() {
        let mut brain = Brain::new();
        brain.initialize();

        let thinkable = ready(10)
            .then(|value| FirstThought {
                counter: RefCell::new(0),
                ready: value,
            })
            .then(|count| TestThought {
                counter: RefCell::new(count - 1),
                ready: count + 5,
            });

        brain.spawn(thinkable);
        brain.think();
    }
}
