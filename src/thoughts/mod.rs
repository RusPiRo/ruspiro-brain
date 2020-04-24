/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # Thinkable
//!
//! The [``Thinkable``] trait shall be implementes for things the [``Brain``] need to thiink on to
//! come to a [``Conclusion``]
//!
use alloc::boxed::Box;
use core::ops;
use core::pin::Pin;

mod combinators;
pub use combinators::*;

mod context;
pub use context::*;
mod thought;
pub(crate) use thought::*;
pub mod wakeable;
pub mod waker;

#[derive(Debug)]
pub enum Conclusion<T> {
    Pending,
    Ready(T),
}

pub trait Thinkable {
    type Output;

    /// The function to progress on a [``Thinkable``]. The [``Brain``] need to activiely think on a
    /// [``Thinkable``] to finally come to any [``Conclusion``] for it.
    #[must_use]
    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output>;

    /// Wrap a [``Thinkable``] with a [``Box``] and [``Pin``] it, so it cannot move in memory
    fn boxed(self) -> Pin<Box<Self>>
    where
        Self: Sized,
    {
        Box::pin(self)
    }

    /// Map the [``Conclusion``] of a [``Thinkable``] to a different value using a closure.
    /// # Example
    /// ```no_run
    /// # use ruspiro_brain::*;
    /// # fn doc() {
    /// let foo = ready(10).map(|value| value + 10 );
    /// # }
    /// ```
    fn map<F, R>(self, function: F) -> Map<Self, F>
    where
        F: FnOnce(Self::Output) -> R,
        Self: Sized,
    {
        Map::new(self, function)
    }

    /// Combine two [``Thinkable``]s in a way that they are sequentially thought of where the [``Conclusion``]
    /// of the first [``Thinkable``] can be used for creating the follow-up [``Thinkable``].
    /// # Example
    /// ```no_run
    /// # use ruspiro_brain::*;
    /// # fn doc() {
    /// let foo = ready(10).then(|num| ready(num + 1));
    /// # }
    /// ```
    fn then<OUT, F>(self, function: F) -> Then<Self, F, OUT>
    where
        OUT: Thinkable,
        F: FnOnce(Self::Output) -> OUT,
        Self: Sized,
    {
        Then::new(self, function)
    }
}

/// Implement the [``Thinkable``] for a mutual borrow of a Thinkable for convinient access to the same
impl<T: ?Sized + Thinkable + Unpin> Thinkable for &mut T {
    type Output = T::Output;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        // calling the thinking function of the Thinkable by dereferencing the pinned Thinkable
        // and pinning it's contents again for the new call
        T::think(Pin::new(&mut **self), cx)
    }
}

/// Implement the [``Thinkable``] for a [``Pin``] to conviniently access it's functions when
/// passed as [``Pin``]
impl<P> Thinkable for Pin<P>
where
    P: Unpin + ops::DerefMut<Target: Thinkable>,
{
    type Output = <<P as ops::Deref>::Target as Thinkable>::Output;

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        Pin::get_mut(self).as_mut().think(cx)
    }
}
