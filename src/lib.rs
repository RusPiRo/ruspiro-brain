/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![doc(html_root_url = "https://docs.rs/ruspiro-brain/0.1.0")]
#![cfg_attr(not(any(test, doctest)), no_std)]
#![feature(associated_type_bounds, llvm_asm)]

//! # RusPiRo Brain
//!
//! This is the **brain** of any RusPiRo - Robot running in a kind of 'async' processing mode.
//! As for a human brain it's quite unlikely that everything get's processed in a sequential order.
//! There are always several thoughts that are processed in parallel/simultaneous to accomplish a
//! certain goal - come to a conclusion or trigger an activity/movement.
//!
//! ## Hint
//! Rust provides the ``async``/``await`` pattern based on ``Future``s to enable a simple to use
//! programming style that results in asynchronous execution. The center of this pattern is
//! the so called ``Executor`` that will drive any open ``Future`` to it's completion. The ``Brain`` is nothing but the
//! specific executor running on a multicore Raspberry Pi.
//!
//!
//!
//!

extern crate alloc;

pub use either::*;
// pub use ruspiro_brain_macros::*;
//pub use ruspiro_timer::{Mseconds, Useconds};

use core::future::Future;
//use ruspiro_interrupt::*;
use ruspiro_singleton::Singleton;
//use ruspiro_console::*;

mod brain;
pub use brain::*;
pub mod mpmc;

mod thought;
mod wakeable;
mod wakerref;

pub(crate) static BRAIN: Singleton<Brain> = Singleton::new(Brain::new());


pub fn init_brain() {
    //println!("########## RusPiRo ------------ BRAIN v0.1.0  ------------ ##########");
    BRAIN.take_for(|brain| brain.initialize());
}

pub fn run_brain() -> ! {
    loop {
        // as long as the executor of the brain has something to think on, think on it
        // there is no need to get exclusive access to the ``Brain`` here as the only data that
        // may change is the **need-to-think-on-queue** that is implemented as a lock free
        // multi producer multi consumer queue
        BRAIN.use_for(|brain| brain.think());
        // that's it, we are done for the moment, so go to sleep until an event occurs:
        // - an interrupt is raised
        // - a SEV instruction was processed
        // - or a new thought was spawned
        /*#[cfg(any(target_arch = "arm", target_arch = "aarch64"))]
        unsafe {
            asm!("wfe")
        }*/
    }
}

/// Spawn a new ``Thought`` to the ``Brain`` to think on.
/// Before this could be called the first time it need to be ensured the ``Brain`` has been initialized.
///
/// # Example
/// ```no_run
/// # use ruspiro_brain::*;
/// # use core::future::Future;
/// # use core::task::{Context, Poll};
/// # use core::pin::Pin;
/// struct Foo {
///     /* fields ommited */
/// }
///
/// impl Foo {
/// /* implementation omitted */
/// }
///
/// impl Future for Foo {
///     type Output = ();
///     fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
///         /* implementation omitted */
/// #       Poll::Pending
///     }
/// }
///
///
/// fn doc() {
///     let thinkable = Foo { /* fields omitted */};
///     spawn(thinkable);
/// }
/// ```
pub fn spawn(thinkable: impl Future<Output = ()> + 'static + Send) {
    // spawning a new Thought does not need a mutual exclusive lock on the Brain as the underlying
    // **need-to-think-on-queue** is implemented as lock free mpmc queue
    BRAIN.use_for(|brain| brain.spawn(thinkable));
}

#[cfg(test)]
mod tests;
