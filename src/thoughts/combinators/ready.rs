/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # An always Ready Thought
//!
use crate::thoughts::{Conclusion, Context, Thought};
use core::pin::Pin;

pub struct ReadyThought<T> {
    value: Option<T>,
}

pub fn ready<T>(value: T) -> ReadyThought<T> {
    ReadyThought { value: Some(value) }
}

impl<T> Thought for ReadyThought<T> {
    type Output = T;

    fn think(self: Pin<&mut Self>, _cx: &mut Context<'_>) -> Conclusion<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        Conclusion::Ready(this.value.take().unwrap())
    }
}
