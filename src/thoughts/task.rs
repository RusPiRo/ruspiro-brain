/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Task
//!
use crate::mpmc::Sender;
use crate::thoughts::{wakeable::WakeAble, Thought};
use alloc::{boxed::Box, sync::Arc};
use core::pin::Pin;
use ruspiro_lock::DataLock;

/// A task is a Thought the brain can think on to come to a conclusion or finish the
/// action this thought was meant to trigger
pub(crate) struct Task {
    /// this is the in-progress thought
    pub thought: DataLock<Option<Pin<Box<dyn Thought<Output = ()> + 'static + Send>>>>,
    /// this is the spawning "channel" that could re-spawn this task when the brain was not able
    /// to complete thinking on thr thought. Without this, the executer could not know how to
    /// re-spawn this task
    pub spawner: Sender<Arc<Task>>,
}

/// As a ``Task`` should be able to be woken implement the ``WakeAble`` trait
impl WakeAble for Task {
    fn wake_by_ref(arc_self: &Arc<Self>) {
        // waking this task means, it has to be pushed back onto the *need-to-think-on-queue*
        // containing all tasks the ``Brain`` should work on.
        // As we only get a borrow of the task, we clone it and push the clone to the queue
        let cloned = arc_self.clone();
        arc_self.spawner.send(cloned);
        // as waking might not have been done based on an IRQ or similar event there is a chance that
        // the cores keep "sleeping". So trigger an event to wake them up
        #[cfg(any(target_arch = "arm", target_arch = "aarch64"))]
        unsafe {
            asm!("sev")
        }
    }
}
