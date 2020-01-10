/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: ???
 **********************************************************************************************************************/

//! # Definition of generic Thoughts a brain could think of
//!
use alloc::boxed::Box;
use core::ops;
use core::pin::Pin;

mod combinators;
pub use combinators::*;

mod context;
pub use context::*;
pub mod task;
pub mod wakeable;
pub mod waker;

#[derive(Debug)]
pub enum Conclusion<T> {
    Pending,
    Ready(T),
}

pub trait Thought {
    type Output;

    /// The function to progress on a thought. The Brain need to activiely think on a thought to
    /// finally come to any conclusion/outcome for it. Otherwise a [Thought] might make nothing
    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output>;

    /// Wrap a [Thought] with a [Box] and [Pin] it
    fn boxed(self) -> Pin<Box<Self>>
    where
        Self: Sized,
    {
        Box::pin(self)
    }

    fn then<OUT, F>(self, function: F) -> Then<Self, OUT, F>
    where
        OUT: Thought,
        F: FnOnce(Self::Output) -> OUT,
        Self: Sized,
    {
        Then::new(self, function)
    }
}

/// Implement the [Thought] for a mutual borrow of a Thought for convinient access to the [Thought]
impl<T: ?Sized + Thought + Unpin> Thought for &mut T {
    type Output = T::Output;

    fn think(mut self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        // calling the thinking function of the thought by dereferencing the pinned Thought
        // and pinning it's contents again for the new call
        T::think(Pin::new(&mut **self), cx)
    }
}

/// Implement the [Thought] for a [Pin] to conviniently access the [Thought] functions when
/// passed as [Pin]
impl<P> Thought for Pin<P>
where
    P: Unpin + ops::DerefMut<Target: Thought>,
{
    type Output = <<P as ops::Deref>::Target as Thought>::Output;

    fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        Pin::get_mut(self).as_mut().think(cx)
    }
}
