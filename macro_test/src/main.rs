#![no_std]
#![no_main]
use ruspiro_allocator::*;
use ruspiro_brain::*;
use ruspiro_console::*;

#[Thinkable]
fn simple() {
    let a = 10;
    let b = a + 5;
    //info!("thought on simple()");
}