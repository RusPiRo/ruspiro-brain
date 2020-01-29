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
pub use either::*;

/// Implementation of the ``Either`` [``Thinkable``]
impl<L, R> Thinkable for Either<L, R>
where
    L: Thinkable,
    R: Thinkable,
{
    type Output = R::Output;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        match *self {
            Either::Left(ref mut l) => l.think(cx),
            Either::Right(ref mut r) => r.think(cx),
        }
    }
}
