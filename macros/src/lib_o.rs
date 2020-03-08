/***************************************************************************************************
 * Copyright (c) 2019 by the authors
 *
 * Author: André Borrmann
 * License: Apache License 2.0
 **************************************************************************************************/
#![doc(html_root_url = "https://docs.rs/ruspiro-brain-macros/0.1.0")]

//! # Brain Macros
//!
//! This crate provides procedural macros that helps to use the features and functions of the
//! [``ruspiro-brain`` crate](https://crates.io/crates/ruspiro-brain).

extern crate proc_macro;
extern crate proc_macro2;
extern crate quote;
extern crate syn;

use proc_macro::TokenStream;
use quote::quote;
use syn::{*, visit::*};

use std::collections::HashMap;

/// Provide the Attribute ``#[WakeUpThought]`` to be used to define the initial ``Thinkable`` the
/// ``Brain`` will think on as soon as beeing alive.
#[proc_macro_attribute]
#[allow(non_snake_case)]
pub fn WakeUpThought(attr: TokenStream, item: TokenStream) -> TokenStream {
    println!("implement WakeUpThought");
    // get the function this attribute is attached to
    let func = parse_macro_input!(item as ItemFn);
    // verify function signature
    // do some verifications on this function to check if it's signature is valid
    let valid_signature = func.abi.is_none()    // no "extern fn" used
        && func.constness.is_none()             // no "const fn"
        && func.vis == Visibility::Inherited    // a module private function
        && func.decl.generics.params.is_empty() // no generics like "func<T>" supported as of now 
        && func.decl.generics.where_clause.is_none() // also no where clause supported
        && func.decl.variadic.is_none() // no variadic "func(...)" parameters supported
        && match func.decl.output { // only default "()" return type allowed for the wakup thought
            ReturnType::Default => true,
            _ => false,
        };
    
    if !valid_signature {
        return syn::Error::new(
            syn::export::Span::call_site(),
            "Invalid signature given for 'WakeUpThought'. The decorated function has to be:\n-not const fn\n-private\n-non generic\n-non variadic\nand should have the default () return type!"
        ).to_compile_error()
        .into();
    }

    let name = syn::Ident::new(
        &"WakeUpThinkable",
        quote::__rt::Span::call_site(),
    );

    let thinkable_code = build_thinkable(&name, &func);
    
    let attrs = &func.attrs;
    // now generate the code that will than be used by the compiler to build this function
    quote!(
        #thinkable_code
        // Define the function the ``Brain`` will call as entry point. This will spawn the WakeUpThinkable
        #(#attrs)*
        #[export_name = "__start_thinking__"]
        pub fn start_thinking() {
            spawn(#name::new());
        }
    )
    .into()
}

/// Provide the Attribute ``#[Thinkable]`` to 'annotate' a function that could be spawned to the `Brain``
/// to asyncronous think on it. The result/conclusion of this ``Thinkable`` can be ``await``ed on to
/// be used in other ``Thinkables``.
/// The result of annotating a function to be ``Thinkable`` will be a generated enum representing the inner
/// body of the function as a state maschine. 
/// Examples:
/// ```no_run
/// #[Thinkable]
/// fn simple() { /* body omitted */ }
/// ```
/// This is the most simple case. Here some arbitrary calculations and output may take place in the function
/// body and nothing is returned. This will result in the following ``Thinkable`` to be implemented:
/// ```no_run
/// enum Simple_Thinkable {
///     State_0(),
///     Empty,
/// }
/// 
/// impl Simple_Thinkable {
///     fn new() -> Self {
///         Self::State_0()
///     }
/// }
/// 
/// impl Thinkable for Simple_Thinkable {
///     type Output = ();
/// 
///     fn think(self: Pin<&mut self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
///         let this = unsafe { self.get_unchecked_mut() };
///         loop {
///             let next = match this {
///                 Self::State_0(_) => {
///                     /* function body goes here */
///                     return Conclusion::Ready(());
///                 }
///             }
///         }
///     }
/// }
/// 
/// // finally the original function call will be adjusted to return the defined [Thinkable]
/// fn simple() -> impl Thinkable<Output = ()> {
///     Simple_Thinkable::new()
/// }
/// ```
/// 
#[proc_macro_attribute]
#[allow(non_snake_case)]
pub fn Thinkable(attr: TokenStream, item: TokenStream) -> TokenStream {
    // get the function that is annotated
    let func = parse_macro_input!(item as ItemFn);

    println!("generate Thinkable for annotated function {}", func.ident.to_string());

    // do some verifications on this function to check if it's signature is valid
    let valid_signature = func.abi.is_none()    // no "extern fn" used
        && func.constness.is_none()             // no "const fn"
        && func.vis == Visibility::Inherited    // a module private function
        && func.decl.generics.params.is_empty() // no generics like "func<T>" supported as of now 
        && func.decl.generics.where_clause.is_none() // also no where clause supported
        && func.decl.variadic.is_none(); // no variadic "func(...)" parameters supported

    if !valid_signature {
        return syn::Error::new(
            syn::export::Span::call_site(),
            "Invalid signature given for 'Thinkable'. The decorated function has to be:\n-not const fn\n-private\n-non generic\n-non variadic"
        ).to_compile_error()
        .into();
    }

    // now get the thinkable name we will need to generate
    let name = syn::Ident::new(
        &format!("{}_thinkable", func.ident.to_string()), quote::__rt::Span::call_site()
    );

    // next get the input parameter of the function as we need to pass them to the thinkable
    let inputs = &func.decl.inputs;

    // also get the result of the function as this will have to be the Output type of the to be generated Thinkable
    let output = match &func.decl.output {
        ReturnType::Type(_, ty) => quote!( #ty ),
        ReturnType::Default => quote!{ () },
    };
    
    // finally parse the original function body to extract the different states the statemachine of the generated
    // Thinkable will require.
    let block = &func.block;
    // the structure generated here and filled from the visitor will contain the inner code block for each state
    // in a hash-map
    let mut function_states = FunctionStates { states: HashMap::new() };


    let stmts = &block.stmts;

    //let mut test = ThinkableFunctionBody{ state: HashMap::new(), state_num: 0 };
    //test.visit_block(block);
    // the thinkable function will be compiled into an enum containing as many enum variants as the
    // thinkable has "await" states + 1 initial and 1 final one.
    // all states carries all the arguments that has been passed to the thinkable function
    // each state also carries the result of the previous awaited thinkable if any as well as the
    // actual thinkable that shall be thought off at this state
    let thinkable_enum = quote!{
        enum #name {
            // The initial state of the thinkable function if nothing has been thought of yet. If the
            // function does not contain any further "await" points this is the only state we get
            State0{#inputs},
            Final(#output),
            // Empty state to ensure previous stored states are properly dropped at state transition
            Empty,
        }
    };

    // the enum representing the thinkable function always comes with the "new" function to create the
    // initial state and pass all function arguments into it
    let mut enum_state0_inputs = Vec::new();
    for input in inputs.iter() {
        match input {
            // get the identifier of all the function arguments
            FnArg::Captured(ArgCaptured {
                pat: syn::Pat::Ident(syn::PatIdent { by_ref: None, ident , ..}),
                ..
            }) => enum_state0_inputs.push(ident),
            _ => unimplemented!(),
        }
    };

    let enum_inputs = &enum_state0_inputs;
    let enum_impl = quote!{
        impl #name {
            pub fn new(#inputs) -> Self {
                Self::State0 {
                    #(#enum_inputs),*
                }
            }
        }
    };

    // the thinkable functions thinkable implementation is able to transition from the initial state
    // to the final one. While in transition phase it's always "Pending" and the individual "sub"-
    // thinkables need to register the provided wakre to get waken when progress is possible to make
    let thinkable_impl = quote!{
        impl Thinkable for #name {
            type Output = #output;
            fn think(self: core::pin::Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
                let this = unsafe { self.get_unchecked_mut() };
                loop {
                    // this loop covers the case where each underlying thinkable immediately returns a
                    // conclusion as in this scenario no waker would be registered to wake this thinkable
                    // again
                    let next = match this {
                        // each state got a proper implementation here. This mean we process the original
                        // code of the funtion till we either reach the end or another "await" point which
                        // would mean we need to switch the state and provide the proper data for it
                        Self::State0{#(#enum_inputs),*} => {
                            // put the original code of the function here until we hit another awaiting
                            // point. If this is the case -> think on it and continue based on it's
                            // conclusion state
                            // For the time beeing: no await point expected, so just take the code as is
                            // end create the final state as the next state with the respective output
                            let conclusion = {
                                #(#stmts)*
                            };
                            Self::Final(conclusion)
                        },

                        // the final state just returns the conclusion result
                        Self::Final(conclusion) => return Conclusion::Ready(conclusion),
                        // we should never reach here with the empty state beeing active
                        Self::Empty => unimplemented!(),
                    };
                    // switch the state
                    *this = Self::Empty;
                    *this = next;
                }
            }
        } 
    };

    let final_code = quote!{
        #thinkable_enum
        #enum_impl
        #thinkable_impl
    };

    final_code.into()

/*    
    let thinkable_code = build_thinkable(&name, &func);

    
    //println!("Thinkable: {:#?}", thinkable_code);

    /********* build the final output *********/
    let attrs = &func.attrs;
    let output = match &func.decl.output {
        ReturnType::Type(_, ty) => quote!( #ty ),
        ReturnType::Default => quote!{ () },
    };
    let inputs = &func.decl.inputs;
    let mut thinkable_inputs = Vec::new();
    for input in inputs.iter() {
        match input {
            // get the identifier of all the function parameters
            FnArg::Captured(ArgCaptured {
                pat: syn::Pat::Ident(syn::PatIdent { by_ref: None, ident , ..}),
                ..
            }) => thinkable_inputs.push(ident),
            _ => unimplemented!(),
        }
    };
    let func_name = &func.ident;
    let code = quote!(   
        #thinkable_code
             
        #(#attrs)*
        fn #func_name(#inputs) -> impl Thinkable<Output = #output> {
            #name::new(#(#thinkable_inputs)*)
        }
    );
    code.into()
    */
}

/// struct representing the logical code block of a thinkeable functions state
struct FunctionStateBody<'a> {
    /// the statements coming from the original thinkable function body comprising
    /// it's states logic
    stmts: Vec<&'a Stmt>,
}

/// struct used to visit the original function body of the function to be treateed as 
/// ``Thinkable`` that stores the states this function will run through
struct FunctionStates<'a> {
    states: HashMap<String, FunctionStateBody<'a>>,
}






/// Build the code that defines the ``Thinkable`` and provides the required implementation to be 
/// spawned at the ``Brain`` based on the decorated function.
/// Basically it will convert:
/// ```ignore
/// #[Thinkable]
/// fn function_name(param1: type) -> result { /* code omitted */ }
/// ```
/// into something like:
/// ```ignore
/// struct function_name_thinkable {
///     param1: type,
/// }
/// 
/// impl function_name_thinkable {
///     fn new(param1: type) -> Self {
///         Self {
///             param1,
///         }
///     }
/// }
/// 
/// impl Thinkable for function_name_thinkable {
///     type Output = result;
///     fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
///         /* code omitted */
///     }
/// }
/// ```
fn build_thinkable(name: &syn::Ident, func: &syn::ItemFn) -> quote::__rt::TokenStream {
    // build the struct definition from the function that shall be spawn to the brain as thought
    let thinkable_struct = build_thinkable_struct(name, &func.decl.inputs);
    // build the struct implementation
    let thinkable_struct_impl = build_thinkable_struct_impl(name, &func.decl.inputs);
    // build the thinkable implementation
    let thinkable_think_impl = build_thinkable_think_impl(name, &func);

    quote!{
        #thinkable_struct
        #thinkable_struct_impl
        #thinkable_think_impl
    }
}

fn build_thinkable_struct(name: &syn::Ident, inputs: &punctuated::Punctuated<syn::FnArg, token::Comma>) -> quote::__rt::TokenStream {
    quote!{
        struct #name {
            #inputs
        }
    }
}

fn build_thinkable_struct_impl(name: &syn::Ident, inputs: &punctuated::Punctuated<syn::FnArg, token::Comma>) -> quote::__rt::TokenStream {
    let mut input_idents = Vec::new();
    for input in inputs.iter() {
        match input {
            // get the identifier of all the function parameters
            FnArg::Captured(ArgCaptured {
                pat: syn::Pat::Ident(syn::PatIdent { by_ref: None, ident , ..}),
                ..
            }) => input_idents.push(ident),
            _ => unimplemented!(),
        }
    }
    quote!{
        impl #name {
            fn new(#inputs) -> Self {
                Self {
                    #(#input_idents)*
                }
            }
        }
    }
}

fn build_thinkable_think_impl(name: &syn::Ident, func: &syn::ItemFn) -> quote::__rt::TokenStream {
    let block = &func.block;
    let stmts = &block.stmts;
    let output = match &func.decl.output {
        ReturnType::Type(_, ty) => quote!( #ty ),
        ReturnType::Default => quote!{ () },
    };

    quote!{
        impl Thinkable for #name {
            type Output = #output;
            fn think(self: core::pin::Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
                
                let res = { 
                    #(#stmts)*
                };

                Conclusion::Ready(res)
            }
        }
    }
}


















/*
struct ThinkableFunctionBody<'a> {
    state: HashMap<String, ThinkableStateBody<'a>>,
    state_num: u32,
}

impl<'a> Visit<'a> for ThinkableFunctionBody<'a> {
    /*fn visit_expr_method_call(&mut self, i: &'a ExprMethodCall) {
        println!("visit method call {:#?}", i);
        visit_expr_method_call(self, i);
    }

    fn visit_expr_call(&mut self, i: &'a ExprCall) {
        println!("visit expression call {:#?}", i);
        visit_expr_call(self, i);
    }
    */
    /*
    fn visit_expr(&mut self, expr: &'a Expr) {
        // we are visiting an expression
        // when we found a "thinkable().await" we need to generate a new state into our statemachine
        // this construct is a "Semi" expression
        //println!("visit expression {:#?}", expr);
        match expr {
            // an "foo().await;" is represented as Field expression where the Member is an identifier "await"
            Expr::Field(
                ExprField {
                    dot_token: Dot, //Token![.],
                    member: Member::Named( ref ident ),
                    ..
                }
            ) if ident.to_string() == "await" => {
                println!("found await {:?}", ident);
            },
            _ => (),
        }
        visit_expr(self, expr)
    }*/
    
    /// while visiting the statements of the thinkable function body we can prepare how this will be
    /// translated into the thinkable "state-machine"
    fn visit_stmt(&mut self, s: &'a Stmt) {
        println!("visit: {:#?}", s);

        let stateId = format!("State{}", self.state_num);
        if self.state.get_mut(&stateId.to_string()).is_none() {
            self.state.insert(stateId.to_string(), ThinkableStateBody { stmts: Vec::new() });
        }

        // check what this statement is about to properly handle the code generation for the state
        // machine
        match s {
            // an expression without a semicolon, this is usually one that will provide the result
            // of the function if it is the last expression
            Stmt::Expr(expr) => {
                println!("found expression");
            },
            // an expression with semicolon, this could be eg. a function/method call awaiting a thinkable
            Stmt::Semi(expr, token) => {
                println!("found semi-colon expression");
                match expr {
                    // an "foo.await;" is represented as Field expression where the Member is "await"
                    Expr::Field( ExprField {
                        dot_token: Dot, //Token![.],
                        member: Member::Named( ref ident ),
                        ..
                    }) if ident.to_string() == "await" => {
                        println!("found call? {:?}", ident);
                    },
                    Expr::Call(binding) => {

                    },
                    _ => (),
                }
            },
            _ => ()
        };

        if let Some(state) = self.state.get_mut(&"State0".to_string()) {
            state.stmts.push(s);
        }

        visit_stmt(self, s);
    }
}
*/