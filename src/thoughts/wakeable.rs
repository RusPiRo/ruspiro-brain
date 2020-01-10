/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/

//! # WakeAble Trait
//! This trait shall be implemented for everything that is abel to be process by the brain and
//! therefore might need to be woken. It's based on the Rust std async/await framework that is not
//! yet available in **no_std** build environments.
//! This trait is mainly the representation of: https://rust-lang-nursery.github.io/futures-api-docs/0.3.0-alpha.16/src/futures_util/task/arc_wake.rs.html
//!

use crate::thoughts::waker::*;
use alloc::sync::Arc;

pub trait WakeAble {
    fn wake(self: Arc<Self>) {
        Self::wake_by_ref(&self)
    }

    fn wake_by_ref(arc_self: &Arc<Self>);

    fn into_waker(self: Arc<Self>) -> Waker
    where
        Self: Sized,
    {
        let wakeable_ptr = Arc::into_raw(self) as *const ();
        Waker::from_raw(RawWaker::new(
            wakeable_ptr,
            wake_wakeable_raw::<Self>,
            wake_by_ref_wakeable_raw::<Self>,
            clone_wakeable_raw::<Self>,
            drop_wakeable_raw::<Self>,
        ))
    }
}

/// get a waker reference from the wakeable given
pub fn waker_ref_from_wakeable<T: WakeAble>(wakeable: &Arc<T>) -> WakerRef<'_> {
    // get the raw pointer to the wakeable reference/borrow passed
    let wakeable = &*wakeable as &T as *const T as *const ();
    let waker = Waker::from_raw(RawWaker::new(
        wakeable,
        wake_wakeable_raw::<T>,
        wake_by_ref_wakeable_raw::<T>,
        clone_wakeable_raw::<T>,
        // WakerRef wakeables are dropped "manually", a drop here would lead to double drops
        noop::<T>,
    ));

    WakerRef::new(waker)
}

/// Trampoline functions that are passed as pointer to the actual waker and will be used to
/// proxy the call to the real wakeable
/// # Safety
/// There is only one way to create the ``Wakeable`` containing the pointers to those functions
pub unsafe fn wake_wakeable_raw<T: WakeAble>(wakeable: *const ()) {
    // transfer the raw pointer pack into it's type pointer
    let wakeable: Arc<T> = Arc::from_raw(wakeable as *const T);
    // wake the wakeable
    WakeAble::wake(wakeable);
}

/// Trampoline functions that are passed as pointer to the actual waker and will be used to
/// proxy the call to the real wakeable
/// # Safety
/// There is only one way to create the ``Wakeable`` containing the pointers to those functions
pub unsafe fn wake_by_ref_wakeable_raw<T: WakeAble>(wakeable: *const ()) {
    // transfer the raw pointer pack into it's type pointer
    let wakeable: Arc<T> = Arc::from_raw(wakeable as *const T);
    // wake the wakeable
    WakeAble::wake_by_ref(&wakeable);
    core::mem::forget(wakeable);
}

/// Trampoline function that is used to clone the wakeable when cloning the waker that refers to this
/// wakeable
/// # Safety
/// There is only one way to create the ``Wakeable`` containing the pointers to those functions
pub unsafe fn clone_wakeable_raw<T: WakeAble>(wakeable: *const ()) -> RawWaker {
    let arc: Arc<T> = Arc::from_raw(wakeable as *const T);
    let cloned = arc.clone();
    // forget both references to keep ref-count up
    core::mem::forget(arc);
    core::mem::forget(cloned);

    RawWaker::new(
        wakeable,
        wake_wakeable_raw::<T>,
        wake_by_ref_wakeable_raw::<T>,
        clone_wakeable_raw::<T>,
        drop_wakeable_raw::<T>,
    )
}

/// Trampoline function that is used to clone the wakeable when cloning the waker that refers to this
/// wakeable
/// # Safety
/// This is safe as there is only one option to create the ``Wakeable`` 
pub unsafe fn drop_wakeable_raw<T: WakeAble>(wakeable: *const ()) {
    drop(Arc::<T>::from_raw(wakeable as *const T));
}

/// # Safety
/// This is a noop trampoline. It's safe as it does nothing
#[inline]
pub unsafe fn noop<T: WakeAble>(_: *const ()) {}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::thoughts::context::Context;
    use ruspiro_lock::DataLock;

    struct CountingWaker {
        nr_wake: DataLock<u32>,
    }

    impl CountingWaker {
        fn new() -> Self {
            CountingWaker {
                nr_wake: DataLock::new(0),
            }
        }

        pub fn wakes(&self) -> u32 {
            *self.nr_wake.try_lock().unwrap()
        }
    }

    impl WakeAble for CountingWaker {
        fn wake_by_ref(arc_self: &Arc<Self>) {
            let mut data = arc_self.nr_wake.try_lock().unwrap();
            *data += 1;
        }
    }

    #[test]
    fn create_waker_from_wakeable() {
        let some_w = Arc::new(CountingWaker::new());

        let w1: Waker = WakeAble::into_waker(some_w.clone());
        assert_eq!(2, Arc::strong_count(&some_w));
        w1.wake_by_ref();
        assert_eq!(1, some_w.wakes());

        let w2 = w1.clone();
        assert_eq!(3, Arc::strong_count(&some_w));

        w2.wake_by_ref();
        assert_eq!(2, some_w.wakes());

        drop(w2);
        assert_eq!(2, Arc::strong_count(&some_w));
        drop(w1);
        assert_eq!(1, Arc::strong_count(&some_w));
    }

    #[test]
    fn create_wakerref_from_wakeable() {
        let some_w = Arc::new(CountingWaker::new());
        let some_wr = waker_ref_from_wakeable(&some_w);

        let w1: Waker = some_wr.clone();
        assert_eq!(2, Arc::strong_count(&some_w));
        w1.wake_by_ref();
        assert_eq!(1, some_w.wakes());

        let w2 = w1.clone();
        assert_eq!(3, Arc::strong_count(&some_w));

        w2.wake_by_ref();
        assert_eq!(2, some_w.wakes());

        drop(w2);
        assert_eq!(2, Arc::strong_count(&some_w));
        drop(w1);
        assert_eq!(1, Arc::strong_count(&some_w));
    }

    struct CountingTask {
        counter: DataLock<u32>,
    }

    impl CountingTask {
        pub fn new() -> Self {
            CountingTask {
                counter: DataLock::new(0),
            }
        }

        pub fn counter(&self) -> u32 {
            *self.counter.try_lock().unwrap()
        }
    }

    impl WakeAble for CountingTask {
        fn wake_by_ref(arc_self: &Arc<Self>) {
            let mut count = arc_self.counter.try_lock().unwrap();
            *count += 1;
        }
    }

    #[test]
    fn create_context_from_wakeable() {
        let task = Arc::new(CountingTask::new());
        let waker = waker_ref_from_wakeable(&task);
        let ctx = &mut Context::from_waker(&*waker);

        ctx.waker().wake_by_ref();
        assert_eq!(1, task.counter());
    }
}
