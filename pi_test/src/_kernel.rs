/*************************************************************************************************** 
 * Copyright (c) 2019 by the authors
 * 
 * Author: D054981 <a.borrmann@sap.com>
 * License: Apache License 2.0 / MIT
 **************************************************************************************************/
#![no_std]
#![no_main]

#[macro_use]
extern crate ruspiro_brain;
extern crate ruspiro_allocator;
extern crate alloc;

use core::pin::Pin;
use alloc::sync::Arc;
use ruspiro_console::*;
use ruspiro_brain::{spawn, Thinkable, Conclusion, Context, WakeUpThought};
use ruspiro_timer::*;
use ruspiro_register::system::*;
use ruspiro_lock::{DataLock, Semaphore};
use ruspiro_interrupt::*;

#[derive(Debug)]
struct CountThought {
    id: u32,
    count: u32,
    max: u32,
    signal: Arc<Semaphore>,
}

impl Thinkable for CountThought {
    type Output = ();

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        // this is safe as no inner field is ever pinned
        let this = unsafe { self.get_unchecked_mut() };
        if this.count < this.max {
            this.count += 1;
            //sleep(2000);
            cx.waker().wake_by_ref();
            Conclusion::Pending
        } else {
            //let core = mpidr_el1::read(mpidr_el1::AFF0::Field).value() as u32;
            //println!("thinkable {} finished", this.id);
            this.signal.up();
            Conclusion::Ready(())
        }
    }
}

struct WaitThought {
    signal: Arc<Semaphore>,
    count: u32,
    now: u64,
}

impl Thinkable for WaitThought {
    type Output = ();

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if this.signal.try_down().is_ok() {
            this.count -= 1;
        }
        if this.count == 0 {
            println!("all thoughts done, took {}ms, {}", (now().0 - this.now)/1000, now().0 as u32);
            Conclusion::Ready(())
        } else {
            cx.waker().wake_by_ref();
            Conclusion::Pending
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

struct CountThought3 {
    id: u32,
    count_to: u32,
    current: u32,
}

impl CountThought3 {
    fn new(id: u32 ,count_to: u32) -> Self {
        Self {
            id,
            count_to,
            current: 0,
        }
    }
}

impl Thinkable for CountThought3 {
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

struct TimedCounterThought {
    count: Arc<DataLock<u32>>,
    max: u32,
}

impl Thinkable for TimedCounterThought {
    type Output = ();

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };                
        let count = this.count.lock();
        println!("think on timed counter - actual {}", *count);
        
        if *count < this.max {
            let waker = cx.waker().clone();
            let count = this.count.clone();
            schedule(Mseconds(1_000), move || {
                *count.lock() += 1;
                waker.wake();
            });
            Conclusion::Pending
        } else {
            println!("done timed counter");
            Conclusion::Ready(())
        }
    }
}

/// Strass test: Spawn num thinkables and see how they progress
fn stress_test(num: u32) {
    let signal = Arc::new(Semaphore::new(0));
    let now = now().0;
    for n in 0..num {
        spawn(CountThought {
            id: n as u32,
            count: 0,
            max: 1000,
            signal: signal.clone(),
        });
    };

    // wait until all thinkeables has finished thinking
    spawn(WaitThought {
        signal: signal.clone(),
        count: num,
        now,
    });
}

fn simple_thinkable() {
    spawn(CountThought2::new(0, 100));
}

fn mapped_thinkable() {
    spawn(
        CountThought3::new(0, 100)
            .map(|count| println!("counted to: {} in map", count))
    );
}

fn then_thinkable() {
    spawn(
        CountThought3::new(0, 100)
            .then(|count| {
                println!("counted to {}, then...", count);
                CountThought2::new(1, count+100)
            })
    );
}

fn map_then_thinkable() {
    spawn(
        CountThought3::new(0, 100)
            .map(|count| println!("counted to: {} in map", count))
            .then(|_| {
                println!("mappend, then...");
                CountThought2::new(1, 50)
            })
    );
}

fn timed_thinkable() {
    spawn(
        TimedCounterThought {
            count: Arc::new(DataLock::new(0)),
            max: 10,
        }
    );
}

#[WakeUpThought]
fn wakeup() {
    println!("awake...start tests");
    timed_thinkable();
}

#[Thinkable]
fn counting_to(max: u32) {

}
/*
awake_with!(
{
    println!("Start Tests");
    //enable_interrupts();
    //simple_thinkable();
    //mapped_thinkable();
    //then_thinkable();
    //map_then_thinkable();
    //enable_interrupts();
    timed_thinkable();
    //stress_test(1000);
}
);
*/