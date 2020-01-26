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
#[macro_use]
extern crate quote;
#[macro_use]
extern crate syn;

use proc_macro::*;
use quote::quote;
use syn::*;

/// Provide the Attribute ``#[WakeUpThought]`` to be used to define the initial ``Thinkable`` the
/// ``Brain`` will think on as soon as beeing alive.
#[proc_macro_attribute]
#[allow(non_snake_case)]
pub fn WakeUpThought(attr: TokenStream, item: TokenStream) -> TokenStream {
    println!("implement WakeUpThought");
    // get the function this attribute is attached to
    let func = parse_macro_input!(item as ItemFn);
    // TODO: check and warn that no attributes shall be passed with the attribute

    // get additional function attributes passed "#[...]"
    let attrs = func.attrs;
    // get the function block {...}
    let block = func.block;
    // get the statements of the function block
    let stmts = block.stmts;

    // now generate the code that will than be used by the compiler to build this function
    quote!(
        use core::pin::Pin;
        // define the thinkable
        struct WakeUpThinkable {}
        // implement the ``Thinkable`` to allow thinking on the provided code
        impl Thinkable for WakeUpThinkable {
            type Output = ();
            fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {

                #(#stmts)*

                Conclusion::Ready(())
            }
        }

        // Define the function the ``Brain`` will call as entry point. This will spawn the WakeUpThinkable
        #(#attrs)*
        #[export_name = "__start_thinking__"]
        pub fn start_thinking() {
            spawn(WakeUpThinkable{});
        }
    )
    .into()
}

/// Provide the Attribute ``#[Thinkable]`` to 'tag' a function that could be spawned to the `Brain``
/// to asyncronous think on it. The result/conclusion of this ``Thinkable`` can be ``await``ed on to
/// be used in other ``Thinkables``
#[proc_macro_attribute]
#[allow(non_snake_case)]
pub fn Thinkable(attr: TokenStream, item: TokenStream) -> TokenStream {
    println!("implement Thinkable");
    // get the function this attribute is attached to
    let func = parse_macro_input!(item as ItemFn);
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

    let ident = func.ident;  // name of the decorated function
    let attrs = func.attrs;  // attributes of the function
    let block = func.block;  // function body
    let stmts = block.stmts; // statements of the function body
    let inputs = func.decl.inputs;  // input parameter of the function
    let output = func.decl.output; // return type of the function

    let thinkable_name = syn::Ident::new(
        &format!("{}_thinkable", ident.to_string()),
        quote::__rt::Span::call_site()
    );

    let mut input_idents = Vec::new();
    let mut input_fields = Vec::new();
    for input in inputs.iter() {
        match input {
            // get the identifier of all the function parameters
            FnArg::Captured(ArgCaptured {
                pat: syn::Pat::Ident(syn::PatIdent { by_ref: None, ident , ..}),
                ty,
                ..
            }) => {
                input_idents.push(ident);
                input_fields.push(quote!(#ident : #ty ));
            },
            _ => unimplemented!(),
        }
    }

    //println!("Input: {:#?}", inputs);
    println!("Output: {:#?}", output);
    println!("Stmts: {:#?}", stmts);

    let struct_fields = &input_fields;
    /********* create the structure carying the Thinkable 'context' given as input ******/
    let thinkable_struct = quote!{
        struct #thinkable_name {
            #(#struct_fields)*
        }
    };

    /******** create the structure implementation to create the Thinkable with the given 'context' 
     *        values ******/
    let new_fields = &inputs;
    let struct_field_idents = &input_idents;
    let thinkable_struct_impl = quote!{
        impl #thinkable_name {
            fn new(#new_fields) -> Self {
                Self {
                    #(#struct_field_idents)*
                }
            }
        }
    };

    /********* create the Thinkable implementation for this one *************/
    let thinkable_output = match output {
        ReturnType::Default => quote!(()),
        //ReturnType::Type(_, syn::Path(syn::TypePath {path, ..})) => path.into(),
        //ReturnType::Type(_, syn::Path(type_path)) => type_path.into(),
        _ => unimplemented!(),
    };

    let thinkable_think_impl = quote!{
        impl Thinkable for #thinkable_name {
            type Output = #thinkable_output;
            fn think(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Conclusion<Self::Output> {
                
                #(#stmts)*

                Conclusion::Ready(())
            }
        }
    };

    /******** create the function that will be used to create the thinkable and return it *******/
    let func_inputs = &inputs;
    let thinkable_inputs = &input_idents;
    let thinkable_func = quote!{
        #(#attrs)*
        fn #ident(#func_inputs) -> impl Thinkable<Output = #thinkable_output> {
            #thinkable_name::new(#(#thinkable_inputs)*)
        }
    };

    println!("Struct: {:#?}", thinkable_struct);
    println!("Impl: {:#?}", thinkable_struct_impl);
    println!("Think: {:#?}", thinkable_think_impl);
    println!("Func: {:#?}", thinkable_func);

    /********* build the final output *********/
    quote!(
        #thinkable_struct

        #thinkable_struct_impl

        #thinkable_think_impl

        #thinkable_func
    ).into()
}
