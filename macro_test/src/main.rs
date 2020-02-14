#![no_std]
#![no_main]
use ruspiro_allocator::*;
use ruspiro_brain::*;
// use ruspiro_console::*;

#[Thinkable]
fn simple() {
    let a = 10;
    let b = a + 5;
    //println!("Test");
}

#[Thinkable]
fn with_arguments(arg1: u32, arg2: u64) {
    //println!("{:?}", arg1);
    wait().await;
}

#[Thinkable]
fn with_return_type() -> u32 {
    //println!("Test");
    42u32
}
