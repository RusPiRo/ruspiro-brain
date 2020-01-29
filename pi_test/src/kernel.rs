#![no_std]
#![no_main]

extern crate ruspiro_brain;
extern crate ruspiro_allocator;

use ruspiro_brain::*;
use ruspiro_console::*;

#[WakeUpThought]
fn wakeup() {
    info!("awake...start thinking");
    spawn(
        some_thinking(100)
            .map(|num| info!("thinking returned {}", num))
    );
}


#[Thinkable]
fn some_thinking(max: u32) -> u32 {
    info!("thinking on something");
    100
}
