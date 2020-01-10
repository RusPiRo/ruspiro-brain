/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Build Script
//!
use std::env;

fn main() {
    // pass the linker script location from the boot crate along
    println!(
        "cargo:linkerscript={}",
        env::var_os("DEP_RUSPIRO_BOOT_LINKERSCRIPT")
            .unwrap_or_else(|| "unknown".into())
            .to_str()
            .unwrap()
    );
}
