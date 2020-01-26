/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # Then combinator
//!
use super::chain::*;
use crate::thoughts::{Conclusion, Context, Thinkable};
use core::pin::Pin;
use pin_utils::unsafe_pinned;
use ruspiro_console::*;

/// Chain two [``Thinkable``]s in a way that we start thinking on the second one, once the first
/// has been come to a conclusion. This combinator takes an existing ``Thinkable`` and uses the
/// provided closure to return a new ``Thinkable``
pub struct Then<IN: Thinkable, F, OUT: Thinkable> {
    chain: Chain<IN, F, OUT>,
}

impl<IN, F, OUT> Then<IN, F, OUT>
where
    IN: Thinkable,
    OUT: Thinkable,
    F: FnOnce(IN::Output) -> OUT,
{
    unsafe_pinned!(chain: Chain<IN, F, OUT>);

    pub(crate) fn new(thought: IN, function: F) -> Then<IN, F, OUT>
    where
        F: FnOnce(IN::Output) -> OUT,
    {
        Then {
            chain: Chain::new(thought, function),
        }
    }
}

/// Implementation of the chained [``Thinkable``]
impl<IN, F, OUT> Thinkable for Then<IN, F, OUT>
where
    IN: Thinkable,
    OUT: Thinkable,
    F: FnOnce(IN::Output) -> OUT,
{
    type Output = OUT::Output;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        self.as_mut().chain().think(cx)
    }
}
