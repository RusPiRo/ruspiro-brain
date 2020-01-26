use super::*;
use alloc::sync::Arc;
use core::pin::Pin;
use ruspiro_lock::Semaphore;

struct CountThought {
    id: u32,
    count_to: u32,
    current: u32,
}

impl CountThought {
    fn new(id: u32 ,count_to: u32) -> Self {
        Self {
            id,
            count_to,
            current: 0,
        }
    }
}

impl Thinkable for CountThought {
    type Output = ();

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if this.current < this.count_to {
            this.current += 1;
            cx.waker().wake_by_ref();
            Conclusion::Pending
        } else {
            println!("counted to {}", this.count_to);
            Conclusion::Ready(())
        }
    }
}

struct CountThought2 {
    id: u32,
    count_to: u32,
    current: u32,
}

impl CountThought2 {
    fn new(id: u32 ,count_to: u32) -> Self {
        Self {
            id,
            count_to,
            current: 0,
        }
    }
}

impl Thinkable for CountThought2 {
    type Output = u32;

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if this.current < this.count_to {
            this.current += 1;
            cx.waker().wake_by_ref();
            Conclusion::Pending
        } else {
            Conclusion::Ready(this.count_to)
        }
    }
}

#[test]
fn simple_thinkable() {
    let mut brain = Brain::new();
    brain.initialize();
    brain.spawn(CountThought::new(0, 100));
    brain.think();
}

#[test]
fn mapped_thinkable() {
    let mut brain = Brain::new();
    brain.initialize();
    brain.spawn(
        CountThought2::new(0, 100)
            .map(|count| println!("counted to: {} in map", count))
    );
    brain.think();
}

#[test]
fn then_thinkable() {
    let mut brain = Brain::new();
    brain.initialize();
    brain.spawn(
        CountThought2::new(0, 100)
            .then(|count| {
                println!("counted to {}, then...", count);
                CountThought::new(1, count+100)
            })
    );
    brain.think();
}

#[test]
fn map_then_thinkable() {
    let mut brain = Brain::new();
    brain.initialize();
    brain.spawn(
        CountThought2::new(0, 100)
            .map(|count| println!("counted to: {} in map", count))
            .then(|_| {
                println!("mappend, then...");
                CountThought::new(1, 50)
            })
    );
    brain.think();
}