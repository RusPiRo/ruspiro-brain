/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # Waker
//! Abstraction of waking thinking on a thought once it make sense to continue thinking on it
//!

use core::marker::{PhantomData, Unpin};
use core::ops::Deref;

/// This stores the trampolines into the actual waker that will be passed by the
/// executor of the brain
pub struct RawWaker {
    /// raw pointer to the actual wakeable implementing the trait `WakeAble`
    wakeable: *const (),
    /// function pointer to trampoline function to call wake on the WakeAble
    wake: unsafe fn(*const ()),
    /// function pointer to trampoline function to call wake_by_ref on the WakeAble
    wake_by_ref: unsafe fn(*const ()),
    /// function pointer to trampoline function to clone the wakeable
    clone: unsafe fn(*const ()) -> RawWaker,
    /// function pointer to trampoline function to drop the wakeable
    drop: unsafe fn(*const ()),
}

impl RawWaker {
    pub fn new(
        wakeable: *const (),
        wake: unsafe fn(*const ()),
        wake_by_ref: unsafe fn(*const ()),
        clone: unsafe fn(*const ()) -> RawWaker,
        drop: unsafe fn(*const ()),
    ) -> Self {
        RawWaker {
            wakeable,
            wake,
            wake_by_ref,
            clone,
            drop,
        }
    }
}

/// The abstract waker used to wake thinking on a thought
pub struct Waker {
    raw_waker: RawWaker,
}

impl Waker {
    /// Create a new abstract waker based on the actual trampolines to the real wakeable
    pub fn from_raw(raw_waker: RawWaker) -> Self {
        Waker { raw_waker }
    }

    /// waking a specific thought to continue thinking on. This is a proxy to the wakeable
    /// stored with this waker
    pub fn wake(self) {
        let wake = self.raw_waker.wake;
        let wakeable = self.raw_waker.wakeable;
        // ensure we do not call drop on our self when leaving as the wakeable will consume us
        core::mem::forget(self);
        // call the wake function on the wakeable
        unsafe { (wake)(wakeable) };
    }

    /// waking a specific thought by reference
    pub fn wake_by_ref(&self) {
        unsafe { (self.raw_waker.wake_by_ref)(self.raw_waker.wakeable) }
    }
}

impl Unpin for Waker {}
unsafe impl Send for Waker {}
unsafe impl Sync for Waker {}

impl Clone for Waker {
    fn clone(&self) -> Waker {
        Waker {
            raw_waker: unsafe { (self.raw_waker.clone)(self.raw_waker.wakeable) },
        }
    }
}

impl Drop for Waker {
    fn drop(&mut self) {
        unsafe { (self.raw_waker.drop)(self.raw_waker.wakeable) }
    }
}

/// A lifetime bound reference owner of a waker
pub struct WakerRef<'a> {
    waker: Waker,
    _marker: PhantomData<&'a ()>,
}

impl<'a> WakerRef<'a> {
    pub fn new(waker: Waker) -> Self {
        WakerRef {
            waker,
            _marker: PhantomData,
        }
    }
}

/// Dereferencing the WakerRef into the reference/borrow of the waker
impl<'a> Deref for WakerRef<'a> {
    type Target = Waker;

    fn deref(&self) -> &Waker {
        &self.waker
    }
}
