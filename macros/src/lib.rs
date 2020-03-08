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
    /*
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
    */

    quote!(
        fn wake_up() {
            
        }
    ).into()
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
///                 Self::State_0() => {
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
        &format!("{}_thinkable", func.ident.to_string()), func.ident.span()
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
    let mut function_states = FunctionStates::default();
    function_states.visit_block(block);

    // generate the enum based on the states we got
    let states = function_states.states.keys().map(|key| {
        syn::Ident::new(key, quote::__rt::Span::call_site())
    });

    let enum_definition = quote!{
        #[allow(non_camel_case_types)]
        enum #name {
            #(#states()),*,
            Empty,
        }
    };

    // next generate the base implementation for the enum to provide the "new" function
    // with the original input parameters. The initial state is always "State_0" and it
    // will always exist. To pass the function inputs to the first state we need to create
    // a list that only contains the identifier but not the types
    let mut input_identifier = Vec::new();
    for input in inputs.iter() {
        match input {
            FnArg::Captured(ArgCaptured {
                pat: syn::Pat::Ident(
                    syn::PatIdent { by_ref: None, ident, .. }
                ),
                ..
            }) => input_identifier.push(ident),
            _ => unimplemented!(),
        }
    };

    let input_identifier_ref = &input_identifier;

    let base_impl = quote! {
        impl #name {
            fn new(#inputs) -> Self {
                Self::State_0(
                    #(#input_identifier_ref),*
                )
            }
        }
    };

    //println!("States: {:#?}", function_states);
    //let states_stmts: Vec<(String, FunctionStateBody)> = function_states.states.into_iter().collect();
    let mut states = Vec::new();
    let mut stmts = Vec::new();
    // from the HashMap create two arrays one with the state as identifier
    // and one with the corresponding statements
    for (key, value) in function_states.states {
        states.push(syn::Ident::new(&key, quote::__rt::Span::call_site()));
        let value_stmts = &value.stmts;
        
        // if this is the final state add the return statement that will conclude the Thinkable
        // with the final calculated value
        if key == format!("State_{}", function_states.current_state) {
            stmts.push(
                quote!(
                    #(#value_stmts)*
                    return Conclusion::Ready(()))
            );
        } else {
            stmts.push(
                quote!(#(#value_stmts)*)
            );
        }
    };

    // println!("Stmts: {:#?}", stmts);
    // finally generate the implementation of the 'think' function of the
    // Thinkable trait
    let thinkable_impl = quote! {
        impl Thinkable for #name {
            type Output = #output;

            #[allow(unreachable_code)]
            fn think(self: core::pin::Pin<&mut Self>, cx: &mut Context<'_>)
                -> Conclusion<Self::Output>
            {
                let this = unsafe { self.get_unchecked_mut() };
                loop {
                    let next = match this {
                        #(
                            Self::#states() => {
                                #stmts
                            }
                        ),*
                        Self::Empty => unimplemented!(),
                    };

                    *this = Self::Empty;
                    *this = next;
                };
            }
        }
    };

    // last but no least implement the function that will return the Thinkable
    let func_name = &func.ident;
    let attrs = &func.attrs;
    let func_impl = quote! {
        #(#attrs)*
        fn #func_name(#inputs) -> impl Thinkable<Output = #output> {
            <#name>::new(#(#input_identifier_ref),*)
        }
    };

    quote!(
        /// Thinkable
        #enum_definition

        #base_impl

        #thinkable_impl

        #func_impl
    ).into()
}

/// struct representing the logical code block of a thinkeable functions state
#[derive(Debug)]
struct FunctionStateBody<'a> {
    /// the statements coming from the original thinkable function body comprising
    /// it's states logic
    stmts: Vec<&'a Stmt>,
}

/// struct used to visit the original function body of the function to be treateed as 
/// ``Thinkable`` that stores the states this function will run through
#[derive(Debug)]
struct FunctionStates<'a> {
    /// the map of statements for each state
    states: HashMap<String, FunctionStateBody<'a>>,
    /// the current state
    current_state: u32,
}

impl<'a> FunctionStates<'a> {
    pub fn default() -> Self {
        Self {
            states: HashMap::new(),
            current_state: 0,
        }
    }

    fn add_statement(&mut self, stmt: &'a Stmt) {
        // check if we do have an entry in the hashmapfor the current state
        let state_id = format!("State_{}", self.current_state);
        if self.states.get_mut(&state_id.to_string()).is_none() {
            self.states.insert(state_id.to_string(), FunctionStateBody { stmts: Vec::new() });
        };

        if let Some(state) = self.states.get_mut(&state_id.to_string()) {
            state.stmts.push(stmt);
        }
    }
}

/// implement the ``Visit``or trait to be able to parse the function body
impl<'a> Visit<'a> for FunctionStates<'a> {
    fn visit_stmt(&mut self, stmt: &'a Stmt) {

        // we need to check for a statement that indicates that we need to generate a new state
        // for the Thinkable we are about to generate. This is the Rust standard keyword "await"
        // in an expression similar to 'foo().await;'
        match stmt {
            Stmt::Semi(expr, _) => {
                // an expression followed by a semicolon is a good candidate
                // now check the inner type of the same
                match expr {
                    Expr::Field(
                        ExprField {
                            dot_token: Dot,
                            member: Member::Named( ref ident),
                            ..
                        }
                    ) if ident.to_string() == "await" => {
                        // TODO: Special treatment here
                    },
                    _ => self.add_statement(stmt),
                }
            },
            _ => self.add_statement(stmt),
        }

        // continue visiting the AST
        visit_stmt(self, stmt);
    }
}
