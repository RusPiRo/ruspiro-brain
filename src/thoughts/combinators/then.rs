/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Then combinator
//!
use super::chain::*;
use crate::thoughts::{Conclusion, Context, Thought};
use core::pin::Pin;
use pin_utils::unsafe_pinned;

/// Chain two ``Thought``s in a way that we start thinking on the second one, once the first
/// has been come to a conclusion. This combinator takes an existing ``Thought`` and uses the
/// provided closure to return a new ``Thought``
pub struct Then<IN: Thought, OUT: Thought, F> {
    chain: Chain<IN, OUT, F>,
}

impl<IN, OUT, F> Then<IN, OUT, F>
where
    IN: Thought,
    OUT: Thought,
{
    unsafe_pinned!(chain: Chain<IN, OUT, F>);

    pub(crate) fn new(thought: IN, function: F) -> Then<IN, OUT, F>
    where
        F: FnOnce(IN::Output) -> OUT,
    {
        Then {
            chain: Chain::new(thought, function),
        }
    }
}

/// Implementation of the chained ``Thought``
impl<IN, OUT, F> Thought for Then<IN, OUT, F>
where
    IN: Thought,
    OUT: Thought,
    F: FnOnce(IN::Output) -> OUT,
{
    type Output = OUT::Output;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        self.as_mut().chain().think(cx)
    }
}
