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
extern crate quote;
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

    let name = syn::Ident::new(
        &format!("{}_thinkable", func.ident.to_string()),
        quote::__rt::Span::call_site(),
    );
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
    println!("Code: {:#?}", code);
    code.into()
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