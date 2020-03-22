#![no_std]
#![no_main]
use ruspiro_allocator::*;
use ruspiro_brain::*;
use ruspiro_console::*;

//#[Thinkable]
fn simple() {
    let a = 10;
    let b = a + 5;
    //info!("thought on simple()");
}

#[Thinkable]
fn simple_stages() {
    let mut a = 10;
    wait(Mseconds(300), ()).await;
    a += 5;
    let b: u32 = wait(Mseconds(100), a + 5).await;
    //let c = b*2 / a;
    //wait(Mseconds(300), ()).await;
}

#[export_name = "__start_thinking__"]
pub fn start_thinking() {
    spawn(
        simple()
    );
}