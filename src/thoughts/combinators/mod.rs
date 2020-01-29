/***********************************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **********************************************************************************************************************/

//! # Thought combinators
//!

mod chain;

mod ready;
pub use ready::*;
mod wait;
pub use wait::*;
mod map;
pub use map::*;
mod then;
pub use then::*;
mod either;
