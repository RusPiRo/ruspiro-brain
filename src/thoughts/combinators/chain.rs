/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Chaining of Futures
//! Inspired by https://docs.rs/futures-util/0.3.1/src/futures_util/future/future/chain.rs.html
//!

use crate::thoughts::{Conclusion, Context, Thinkable};
use core::marker::Unpin;
use core::pin::Pin;
use ruspiro_console::*;

/// As thinking on a ``Thought`` that already has come to a ``Conclusion`` violates the rules we need
/// to keep track of the state of the current chain
pub(crate) enum Chain<IN, F, OUT> {
    Inbound(IN, Option<F>),
    Outbound(OUT),
    Empty,
}

impl<IN: Unpin, F, OUT: Unpin> Unpin for Chain<IN, F, OUT> {}

impl<IN, F, OUT> Chain<IN, F, OUT>
where
    IN: Thinkable,
    OUT: Thinkable,
    F: FnOnce(IN::Output) -> OUT,
{
    pub(crate) fn new(inbound: IN, function: F) -> Chain<IN, F, OUT> {
        Chain::Inbound(inbound, Some(function))
    }

    pub(crate) fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<OUT::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        // This "loop" is actrually run only twice in case the initial state of the ``Chain`` is ``Inbound``.
        // It's here to ensure that we will think on the outbound ``Thought`` right after the inbound
        // one has come to a conclusion. Otherwise there would be nothing that would wake up the outbound
        // ``Thought`` and we would never think on it again. An alternative would have been to call
        // ``wake_by_ref`` on the ``Waker`` of the ``Context`` provided, but this might cause a delay
        // in thinking as this ``Thought`` is than spawned to the end ot the 'need-to-think-on-queue'
        // which should be omitted in this case
        loop {
            let (function, value) = match this {
                // the current state of the ``Chain`` is ``Inbound`` so let's think on the incomming ``Thought``
                Chain::Inbound(thought, function) => {
                    match unsafe { Pin::new_unchecked(thought) }.think(cx) {
                        // inbound is still pending so just return pending - leaves the loop
                        Conclusion::Pending => return Conclusion::Pending,
                        // inbound is ready so construct outbound ``Thought`` with the given function
                        // this will change the current state after the match and re-enter the loop
                        // matching the next arm and leaving the loop there
                        Conclusion::Ready(value) => (function, value),
                    }
                }
                // the current state of the ``Chain`` is ``Outbound`` so let's think on the outbound ``Thought``
                // - leaves the loop
                Chain::Outbound(thought) => {
                    return unsafe { Pin::new_unchecked(thought) }.think(cx)
                }
                Chain::Empty => unreachable!(),
            };
            let outbound = (function.take().unwrap())(value);
            // store an empty state to properly drop the inbound ``Thought``
            *this = Chain::Empty;
            // now store the new state
            *this = Chain::Outbound(outbound);
        }
    }
}
