#![no_std]
#![no_main]

#[macro_use]
extern crate ruspiro_boot;
extern crate ruspiro_allocator;

use ruspiro_brain::*;
use ruspiro_console::*;

come_alive_with!(kernel_alive);
run_with!(kernel_run);


pub fn kernel_alive(core: u32) {
    if core == 0 {
        init_brain();
    }
    // your one-time initialization goes here
    println!("Kernel alive on core {}", core);
}

async fn number() -> u32 {
    25
}

pub fn kernel_run(core: u32) -> ! {
    // your processing logic goes here
    println!("Kernel running on core {}", core);

    if core == 0 {
        println!("create an acync fcuntion");
        let test = async {
            let num = number().await;
            println!("running async :) - {}", num);
        };

        println!("spawn an async function");
        spawn(test);
    }

    run_brain();
}