/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # A Thought
//! A [``Thought``] is a container that wrapps a [``Thinkable``] to allow the [``Brain``] to think on
//! it. The [``Thought``] keeps a reference to the [``Thinkable``] and allows re-thinking on the
//! same by spawning the [``Thought``] again to the [``Brain``]
//!
use crate::mpmc::Sender;
use crate::thoughts::{wakeable::WakeAble, Thinkable};
use alloc::{boxed::Box, sync::Arc};
use core::pin::Pin;
use ruspiro_lock::DataLock;

/// A [``Thought``] is the entity the brain can think on to come to a [``Conclusion``] or finish the
/// action this [``Thought``]] was meant to trigger
pub(crate) struct Thought {
    /// this is the thinkable this [``Thought``] should make progress on
    pub thinkable: DataLock<Option<Pin<Box<dyn Thinkable<Output = ()> + 'static + Send>>>>,
    /// this is the spawning "channel" that could re-spawn this task when the brain was not able
    /// to complete thinking on thr thought. Without this, the executer could not know how to
    /// re-spawn this task
    pub spawner: Sender<Arc<Thought>>,
}

/// As a [``Thought``] should be able to be woken to re-think implement the [``WakeAble``] trait
impl WakeAble for Thought {
    fn wake_by_ref(arc_self: &Arc<Self>) {
        // waking this task means, it has to be pushed back onto the *need-to-think-on-queue*
        // containing all tasks the ``Brain`` should work on.
        // As we only get a borrow of the task, we clone it and push the clone to the queue
        let cloned = arc_self.clone();
        arc_self.spawner.send(cloned);
        /* TODO: use a more generic API here to remove inline assembly and architecture dependencies
           if possible
        */
        // as waking might not have been done based on an IRQ or similar event there is a chance that
        // the cores keep "sleeping". So trigger an event to wake them up
        #[cfg(any(target_arch = "arm", target_arch = "aarch64"))]
        unsafe { asm!("sev") };
    }
}
