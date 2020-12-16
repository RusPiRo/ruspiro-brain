/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: MIT OR Apache License 2.0
 **********************************************************************************************************************/
 #![doc(html_root_url = "https://docs.rs/ruspiro-brain/||VERSION||")]
 #![cfg_attr(not(any(test, doctest)), no_std)]
 
//! # The Brain
//!

extern crate alloc;

mod thought;
mod wakeable;

use alloc::{boxed::Box, sync::Arc};
use core::{
    future::Future,
    pin::Pin,
    task::{Context, Poll},
};
use ruspiro_channel::mpmc;
use ruspiro_lock::sync::{Mutex, RWLock};

use thought::*;
use wakeable::Wakeable;

pub static BRAIN: RWLock<Brain> = RWLock::new(Brain::new());

pub struct Brain {
    /// the sender side of the mpmc channel to pass the ``Thought``s that
    /// require processing
    sender: Option<mpmc::Sender<Arc<Thought>>>,
    /// the receiver side of the mpmc channel the ``Brain`` picks ``Thought``s
    /// from to process them
    receiver: Option<mpmc::Receiver<Arc<Thought>>>,
}

impl Brain {
    const fn new() -> Self {
        Self {
            sender: None,
            receiver: None,
        }
    }

    pub fn init(&mut self) {
        let (sender, receiver) = mpmc::channel();
        self.sender.replace(sender);
        self.receiver.replace(receiver);
    }

    /// Do the actual thinking - check for Thoughts that waits for processing
    /// and drive them to completion
    pub fn do_thinking(&self) {
        // check if there is a new Thought available in the channel
        if let Some(ref receiver) = self.receiver {
            //info!("starte thinking");
            loop {
                while let Ok(thought) = receiver.recv() {
                    //info!("think on a thought");
                    // create the Waker from the current Thought
                    let waker = Wakeable::into_waker(&thought);
                    //println!("{:?}", waker);
                    // create the Context from the given Waker
                    let mut context = Context::from_waker(&waker);
                    // lock the Future contained in the Thought and poll it
                    let mut thinkable = thought.thinkable.lock();
                    if let Poll::Pending = thinkable.as_mut().poll(&mut context) {
                        // if the state is Poll::Pending we just unlock the Future
                        drop(thinkable);
                        // in case it will be still valid and required to re-process this
                        // Thought the Waker will re-send it through the channel
                    }
                }
            }
        }
    }

    /// Add a new `Future` to the [Brain], so it can be processed
    fn think_on(&self, thinkable: Box<dyn Future<Output = ()> + 'static>) {
        //info!("think on a new Thought");
        // ensure the given Future is getting a fixed position on the HEAP
        let thinkable = Pin::from(thinkable);
        if let Some(ref sender) = self.sender {
            // create the Thought
            let thought = Arc::new(Thought {
                thinkable: Mutex::new(thinkable),
                sender: sender.clone(),
            });
            // push the Thought to the list of thoughts to think on
            sender.send(thought);
        }
    }
}

pub fn spawn_boxed(thinkable: Box<dyn Future<Output = ()> + 'static>) {
    BRAIN.read().think_on(thinkable);
}

pub fn spawn(thinkable: impl Future<Output = ()> + 'static) {
    BRAIN.read().think_on(Box::from(thinkable));
}
