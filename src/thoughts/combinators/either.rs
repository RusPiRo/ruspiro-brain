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
use either::Either;

/// Implementation of the ``Either`` [``Thinkable``]
impl<L, R> Thinkable for Either<L, R>
where
    L: Thinkable,
    R: Thinkable<Output = L::Output>,
{
    type Output = <R as Thinkable>::Output;

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        match this {
            Either::Left(left) => unsafe { Pin::new_unchecked(left) }.think(cx),
            Either::Right(right) => unsafe { Pin::new_unchecked(right) }.think(cx),
        }
    }
}
