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

#[Thinkable]
fn simple_stages() {
    let a = 10;
    wait(Mseconds(100), ()).await;
    let b = a + 5;
    wait(Mseconds(300), ()).await;
}

#[export_name = "__start_thinking__"]
pub fn start_thinking() {
    spawn(
        simple()
    );
}