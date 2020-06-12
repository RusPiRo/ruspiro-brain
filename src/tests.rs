use super::*;
use alloc::sync::Arc;
use core::pin::Pin;
use core::future::Future;
use core::task::{Context, Poll};
use futures_util::future::{FutureExt, ready};
use ruspiro_lock::Semaphore;

struct CountThought {
    id: u32,
    count_to: u32,
    current: u32,
}

impl CountThought {
    fn new(id: u32, count_to: u32) -> Self {
        Self {
            id,
            count_to,
            current: 0,
        }
    }
}

impl Future for CountThought {
    type Output = ();

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if this.current < this.count_to {
            this.current += 1;
            cx.waker().wake_by_ref();
            Poll::Pending
        } else {
            println!("counted to {}", this.count_to);
            Poll::Ready(())
        }
    }
}

struct CountThought2 {
    id: u32,
    count_to: u32,
    current: u32,
}

impl CountThought2 {
    fn new(id: u32, count_to: u32) -> Self {
        Self {
            id,
            count_to,
            current: 0,
        }
    }
}

impl Future for CountThought2 {
    type Output = u32;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if this.current < this.count_to {
            this.current += 1;
            cx.waker().wake_by_ref();
            Poll::Pending
        } else {
            Poll::Ready(this.count_to)
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
    brain.spawn(CountThought2::new(0, 100).map(|count| println!("counted to: {} in map", count)));
    brain.think();
}

#[test]
fn then_thinkable() {
    let mut brain = Brain::new();
    brain.initialize();
    brain.spawn(CountThought2::new(0, 100).then(|count| {
        println!("counted to {}, then...", count);
        CountThought::new(1, count + 100)
    }));
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
            }),
    );
    brain.think();
}

#[test]
fn use_async() {
    async fn counting() {
        let count = CountThought2::new(0, 200).await;
        println!("counted in async fn to {}", count);
    };

    let mut brain = Brain::new();
    let _ = brain.initialize();

    brain.spawn(counting());

    brain.think();
}
