
use core::task::Waker;
use core::marker::PhantomData;
use core::ops::Deref;
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