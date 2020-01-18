/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # Map combinator
//!
use crate::thoughts::{Conclusion, Context, Thinkable};
use core::pin::Pin;
use pin_utils::{unsafe_pinned, unsafe_unpinned};

pub struct Map<IN, F> {
    thought: IN,
    function: Option<F>,
}

impl<IN: Unpin, F> Unpin for Map<IN, F> {}

impl<IN, F> Map<IN, F>
where
    IN: Thinkable,
{
    unsafe_pinned!(thought: IN);
    unsafe_unpinned!(function: Option<F>);

    pub(crate) fn new(thought: IN, function: F) -> Map<IN, F> {
        Map {
            thought,
            function: Some(function),
        }
    }
}

/// Implementation of the mapped [``Thinkable``]
impl<IN, F, R> Thinkable for Map<IN, F>
where
    IN: Thinkable,
    F: FnOnce(IN::Output) -> R,
{
    type Output = R;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        // use the mapping function to return the original concluded value to the new one
        match self.as_mut().thought().think(cx) {
            Conclusion::Ready(orig) => {
                let function = self.function().take().unwrap();
                Conclusion::Ready((function)(orig))
            }
            Conclusion::Pending => Conclusion::Pending,
        }
    }
}
