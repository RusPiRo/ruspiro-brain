#![no_std]
#![no_main]

extern crate ruspiro_brain;
extern crate ruspiro_allocator;

use ruspiro_brain::*;
use ruspiro_console::*;

#[WakeUpThought]
fn wakeup() {
    spawn(some_thinking(100));
}

#[Thinkable]
fn some_thinking(max: u32) {
    info!("thinking on counting");
}