/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/
#![doc(html_root_url = "https://docs.rs/ruspiro-brain/0.1.0")]
#![cfg_attr(not(any(test, doctest)), no_std)]
#![feature(associated_type_bounds, asm)]

//! # RusPiRo Brain
//! This is the **brain** of any RusPiRo - Robot running in an async processing mode. As for a human
//! it's quite unlikely that everything get's processed in a sequential order. There are always several
//! tasks that are done in parallel or simultaneous to accomplish a certain goal.
//!
//! ## Hint
//! Rust provides the ``async``/``await`` pattern based on ``Future``s to enable a simple to use
//! programming style that results in parallel/simultaneous execution. The center of this pattern is
//! the so called ``Executor`` that will drive any open ``Future`` to it's completion. However, the
//! framework provided by Rust is stabilized but not available for **no_std** crates or **embedded**
//! developments. Therefore this crate *borrows* the concepts of Rust standard and implement a light-
//! weight version of this.
//!
//! ## Parts of this crate
//!
//! The following table gives an overview on the different peaces of this crate and their purpose and
//! allows to get some insights on how this things work together. In addition the corresponding Rust
//! standard entity who's concepts has been borrowed to implement this crate.
//!
//! The implementation has also been inspired by the [Rust Async Book](https://rust-lang.github.io/async-book).
//! The names for structures and traits are choosen to give the whole implementation a bit more the
//! touch of an roboter that will be built with it...
//!
//! Trait / Structure | Rust 'std' comparable | Description
//! ------------------|-----------------------|---------------
//! ``Thought``       | [``Future``](https://docs.rs/futures/0.3.1/futures/prelude/trait.Future.html) | The abstract thing a brain can process. But to come to a conclusion the ``Brain`` need to actively **think** on it.
//! ``Task``          | | This a logical unit containg a ``Thought`` the ``Brain`` can think on to drive it to a ``Conclusion``. It also contains a reference to the ``Brain``s ``Spawner`` to be able to put this ``Task`` back onto the Queue of things to think on again.
//! ``spawn``         | | This function is used to spawn new ``Thought``s to the ``Brain`` so it could think on those to make progress and try to come to a conclusion. The ``Thought`` is internally wrapped into a ``Task`` and pushed to the *need-to-think-on-queue*
//!
//!
//!

#[cfg(not(any(test, doctest)))]
#[macro_use]
extern crate ruspiro_boot;
extern crate alloc;

use ruspiro_singleton::Singleton;

mod brain;
mod mpmc;
use brain::*;

mod thoughts;
pub use thoughts::*;

pub(crate) static BRAIN: Singleton<Brain> = Singleton::new(Brain::new());

#[cfg(not(any(test, doctest)))]
come_alive_with!(alive);

#[cfg(not(any(test, doctest)))]
run_with!(run);

extern "C" {
    fn awake_with();
}

fn alive(core: u32) {
    // do the initial setup of the brain as soon as the main core, which is the first, is alive
    if core == 0 {
        println!("\r\n########## RusPiRo ------------ BRAIN v0.0.1  ------------ ##########");
        BRAIN.take_for(|brain| brain.initialize());
        // if the initialization of the ``Brain`` has been done we could call the entry point the
        // user of this crate will provide. This entry-point returns the initial ``Thought`` the
        // ``Brain`` should think on. This would usually lead to more ``Thought``s spawned and
        // thought on
        // TODO: until we exactly know how to provide an external entrypoint that could act as the
        // main ``Thought`` just call an awaken function at the consumer side of this crate
        // This function has to spawn it's ``Thoughts`` to the ``Brain`` if it like to make async
        // progress on them, to ensure all cores are kicked off before doing so, move this into the
        // ``run`` function for the time beeing...
        // unsafe { awake_with() };
    }
}

fn run(core: u32) -> ! {
    if core == 0 {
        // the main core shall call the crates consumers awaking function to get the initial ``Thought``
        // spawned to the ``Brain``. If this function does not spawn any ``Thought`` the ``Brain``
        // falls asleep
        unsafe { awake_with() };
    }

    loop {
        // as long as the executor of the brain has something to think on, think on it
        BRAIN.use_for(|brain| brain.think());
        // that's it, we are done for the moment, so go to sleep until an event occurs:
        // - an interrupt is raised
        // - a SEV instruction was processed
        //#[cfg(any(target_arch="arm", target_arch="aarch64"))]
        //unsafe { asm!("wfe") }
    }
}

/// Spawn a new ``Thought`` to the ``Brain`` to think on.
/// Before this could be called the first time it need to be ensured the ``Brain`` has been initialized.
///
/// # Example
/// ```no_run
/// # use ruspiro_brain::{*, thoughts::*};
/// # use core::pin::Pin;
/// struct FooThought {
///     /* fields ommited */
/// }
///
/// impl FooThought {
/// /* implementation omitted */
/// }
///
/// impl Thought for FooThought {
///     type Output = ();
///     fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
///         /* implementation omitted */
/// #       Conclusion::Pending
///     }
/// }
///
///
/// fn doc() {
///     let thought = FooThought{ /* fields omitted */};
///     spawn(thought);
/// }
/// ```
pub fn spawn(thought: impl Thought<Output = ()> + 'static + Send) {
    BRAIN.use_for(|brain| brain.spawn(thought));
}

/// Expand the code block given within { } to this macro to a generic Thought "body" and spawn it to
/// the ``Brain``. If this code does not spawn further ``Thougths`` the ``Brain`` goes to sleep
/// after it has finished thinking on the provided code
#[macro_export]
macro_rules! awake_with {
    ($code:block) => {
        mod _brain_awake {
            use super::*;
            use core::pin::Pin;
            use ruspiro_brain::*;

            pub struct AwakeThought;

            impl Thought for AwakeThought {
                type Output = ();

                fn think(self: Pin<&mut Self>, _cx: &mut Context<'_>) -> Conclusion<Self::Output> {
                    // wrap the original code into a function in case it uses ``return`` statement
                    // as this return should not outbreak the ``think`` call as we need to return
                    // a Conclusion
                    fn original() {
                        $code
                    }

                    original();
                    Conclusion::Ready(())
                }
            }
        }

        #[no_mangle]
        fn awake_with() {
            spawn(_brain_awake::AwakeThought)
        }
    };
}

#[cfg(test)]
mod tests;
