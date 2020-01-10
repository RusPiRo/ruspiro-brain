/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Title goes here
//!

use crate::thoughts::waker::*;
use core::marker::PhantomData;

/// The context is passed to the thought whenever it will be thought on. At the time beeing it contains only the
/// reference to the ``Waker`` that is able to wake this thought for further thinking in case it has not come to
/// a conclusion after the first thinking and needs "re-thinking"
pub struct Context<'a> {
    waker: &'a Waker,
    // Ensure we future-proof against variance changes by forcing
    // the lifetime to be invariant (argument-position lifetimes
    // are contravariant while return-position lifetimes are
    // covariant).
    _marker: PhantomData<fn(&'a ()) -> &'a ()>,
}

impl<'a> Context<'a> {
    #[inline]
    pub fn from_waker(waker: &'a Waker) -> Self {
        Context {
            waker,
            _marker: PhantomData,
        }
    }

    #[inline]
    pub fn waker(&self) -> &'a Waker {
        &self.waker
    }
}
