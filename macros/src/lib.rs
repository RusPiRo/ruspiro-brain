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

use std::collections::{HashMap, BTreeMap};


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
///                 }Self::Empty => ::core::panicking::panic("not implemented"),
///             };
///             *this = Self::Empty;
///             *this = next;
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
///  A Thinkable function that does have some await points that might look like this
/// ```no_run
/// #[Thinkable]
/// fn simple() {
///     /* body parts omitted */
///     wait(Mseconds(1000), ()).await;
///     /* body parts omitted */
///     let a = wait(Mseconds(500), 25).await;
///     /* body parts omitted */
/// }
/// ```
/// This is the most simple case. Here some arbitrary calculations and output may take place in the function
/// body and nothing is returned. This will result in the following ``Thinkable`` to be implemented:
/// ```no_run
/// enum Simple_Thinkable {
///     // initial state before the first await point
///     State_0(),
///     // state waiting for the Thinkable of the first await point
///     State_1(Pin<Box<dyn Thinkable<Output = ()>>>),
///     // state waiting for the second await point
///     State_2(Pin<Box<dyn Thinkable<Output = ()>>>),
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
///                     /* function body till the first await point goes here */
///                     // from the await point build the next state
///                     Self::State_1(
///                         Box::pin(
///                             wait(Mseconds(1000), ())
///                         )
///                     )
///                 },
///                 Self::State_1() => {
///                     
///                 },
///                 Self::Empty => ::core::panicking::panic("not implemented"),
///             };
///             *this = Self::Empty;
///             *this = next;
///         }
///     }
/// }
/// 
/// // finally the original function call will be adjusted to return the defined [Thinkable]
/// fn simple() -> impl Thinkable<Output = ()> {
///     Simple_Thinkable::new()
/// }
/// ```
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
    let mut state_names = Vec::new();
    let mut state_signature = Vec::new();
    for (key, value) in function_states.states.iter() {
        state_names.push(
            syn::Ident::new(&format!("State_{}", key), quote::__rt::Span::call_site())
        );

        if *key == 0 {
            state_signature.push(
                quote!( () )
            );
        } else {
            let state_locals = &value.locals;
            state_signature.push(
                quote!(
                    { wait_for: core::pin::Pin<alloc::boxed::Box<dyn Thinkable<Output = ()>>>,
                      #(#state_locals),*
                    })
            )
        }
    }

    let enum_definition = quote!{
        #[allow(non_camel_case_types)]
        enum #name {
            #(#state_names #state_signature),*,
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
    let mut state_branch = Vec::new();
    let mut stmts = Vec::new();
    // from the HashMap create two arrays one with the state as identifier
    // and one with the corresponding statements
    let size = function_states.states.len();
    let call_states: Vec<((u32, FunctionStateBody<'_>), usize)> = function_states.states.into_iter().zip(0..size).collect();
    
    for ((key, value), index) in &call_states { //function_states.states.iter().clone() {
        // create the match branch name 
        let branch_name = syn::Ident::new(&format!("State_{}", key), quote::__rt::Span::call_site());
        // only the first match branch does not contain a Thinkable to wait for,
        // all other states refer to a THinkable they need to wait for before the state continues processing
        // the contained body...
        if *index == 0 {
            state_branch.push(
                quote!(Self::#branch_name())
            );
        } else {
            state_branch.push(
                quote!(Self::#branch_name(wait_for))
            );
        }
        // prepare the statements that shall be used within this state

        // the statements of the original body that shall be run as part of this state
        let value_stmts = &value.stmts;
        let body_stmts = quote!(#(#value_stmts)*);
        // the statements that either return the final conclusion or transition to the next state as
        // there was another await point in the original body
        let next_state_stmts = if (index + 1) == call_states.len() {
            // the last state returns the final conclusion all is done...
            // TODO: return the conclusion value
            quote!( return Conclusion::Ready(state_result))
        } else {
            // intermediate states will lead to a new state with the new Thinkable we are waiting for
            let ((_, next_value),_) = &call_states[index + 1];
            if let Some(await_call) = next_value.await_call {
                // create the name of the next state we will be in when waiting for this thinkable
                let statename = syn::Ident::new(&format!("State_{}", key + 1), quote::__rt::Span::call_site());
                quote!(
                    Self::#statename(
                        alloc::boxed::Box::pin(
                            #await_call
                        )
                    )
                )
            } else {
                quote!()
            }
        };
        // if this state was not the initial one we need to check if the Thinkable we are waiting for has come
        // to a conclusion
        let state_stmts = if *index > 0 {
            quote!(
                match wait_for.as_mut().think(cx) {
                    // the Thinkable we wait for is still not ready, so no progress here
                    Conclusion::Pending => return Conclusion::Pending,
                    // the Thinkable we wait for has come to a conclusion -> continue with this state
                    Conclusion::Ready(result) => {
                        let state_result = {
                            #body_stmts
                        };
                        #next_state_stmts
                    }
                }

            )
        } else {
            quote!(
                #body_stmts
                #next_state_stmts
            )
        };

        stmts.push(state_stmts);
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
                            #state_branch => {
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

    // define the structure containing the function bodies local variables
    let locals_name = syn::Ident::new(
        &format!("{}_thinkable_locals", func.ident.to_string()), func.ident.span()
    );
    let locals_def = &function_states.local_defs;
    //println!("local defs: {:#?}", locals_def);
    let thinkable_locals = quote!(
        struct #locals_name {
            #(#locals_def),*
        }
    );

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
    await_call: Option<&'a Expr>,
    /// the statements coming from the original thinkable function body comprising
    /// it's states logic
    //stmts: Vec<&'a Stmt>,
    stmts: Vec<Stmt>,
    /// the list of local definitions of the current state that might need to be 
    /// passed onto the next state
    locals: Vec<FieldValue>,
    _p: core::marker::PhantomData<&'a Stmt>,
}

#[derive(Debug)]
struct StmtMetadata<'a> {
    isAwait: bool,
    await_call: Option<&'a Expr>,
}

/// struct used to visit the original function body of the function to be treateed as 
/// ``Thinkable`` that stores the states this function will run through
#[derive(Debug)]
struct FunctionStates<'a> {
    /// the map of statements for each state
    states: BTreeMap<u32, FunctionStateBody<'a>>,
    /// the current state
    current_state: u32,
    /// the metadata of the current statement that is visited
    /// to decide what to do after it has been parsed
    current_stmt_meta: Option<StmtMetadata<'a>>,
    local_defs: Vec<FieldValue>,
}

impl<'a> FunctionStates<'a> {
    pub fn default() -> Self {
        let mut state = Self {
            states: BTreeMap::new(),
            current_state: 0,
            current_stmt_meta: None,
            local_defs: Vec::new(),
        };
        state.add_state(None);
        
        state
    }

    fn add_state(&mut self, await_call: Option<&'a Expr>) {
        self.states.insert(
            self.current_state,
            FunctionStateBody { 
                stmts: Vec::new(),
                locals: Vec::new(),
                await_call, 
                _p: core::marker::PhantomData
            }
        );
    }

    //fn add_statement(&mut self, stmt: &'a Stmt) {
    fn add_statement(&mut self, stmt: Stmt) {
        // check if we do have an entry in the hashmap for the current state
        if let Some(state) = self.states.get_mut(&self.current_state) {
            state.stmts.push(stmt);
        }
    }

    fn add_local_def(&mut self, local_def: FieldValue) {
        // check if we do have an entry in the hashmap for the current state
        if let Some(state) = self.states.get_mut(&self.current_state) {
            state.locals.push(local_def);
        }
    }
}

/// implement the ``Visit``or trait to be able to parse the function body
impl<'a> Visit<'a> for FunctionStates<'a> {
    fn visit_expr_struct(&mut self, i: &'a ExprStruct) {
        println!("{:#?}", i);
        visit_expr_struct(self, i)
    }
    /// visit an expression field - this is whenever a ".await" happened
    fn visit_expr_field(&mut self, expr: &'a ExprField) {
        // as the statement is always visited before the expression the meta data
        // is always available
        let mut stmt_meta = self.current_stmt_meta.take().unwrap();

        match expr {
            ExprField {
                base,
                dot_token: Dot,
                member: Member::Named(ref ident),
                ..
            } if ident.to_string() == "await" => {
                //println!("found await point as part of the statement: \r\n {:#?}", expr);
                stmt_meta.isAwait = true;
                stmt_meta.await_call = Some(base);
            },
            _ => ()
        }

        self.current_stmt_meta.replace(stmt_meta);

        visit_expr_field(self, expr)
    }

    /// visit any local variable declaration inside the function body
    /// based on them we will later generate the local thinkable context
    /// As locals might not be used accross await points this might lead to an
    /// unoptimized usage of this - we will handle optimizations at a later point ;)
    fn visit_local(&mut self, local: &'a Local) {
        // extract the identifier and the type from the local
        match local {
            Local {
                //let_token: Let,
                pats,
                ty: Some(
                    (
                        Colon,
                        path
                    )
                ),
                ..
            } => {
                // extract the identifier and adjust the assignment
                let local_def = quote!(#pats: #path);
                println!("Local def: {:#?}", local_def);
                let tmp: FieldValue = syn::parse2(local_def).unwrap();
                //self.local_defs.push(tmp);
                self.add_local_def(tmp);
            },
            _ => ()
        }
        visit_local(self,local)
    }
    /*fn visit_expr(&mut self, e: &'a Expr) {
        println!("EXPR: {:#?}", e);
        visit_expr(self, e)
    }*/
/*
    fn visit_expr_let(&mut self, i: &'a ExprLet) {
        println!("LET: {:#?}", i);
        visit_expr_let(self, i)
    }

    fn visit_expr_call(&mut self, i: &'a ExprCall) {
        println!("CALL: {:#?}", i);
        visit_expr_call(self, i)
    }

    fn visit_expr_binary(&mut self, i: &'a ExprBinary) {
        println!("BINARY: {:#?}", i);
        visit_expr_binary(self, i)
    }
*/
    fn visit_stmt(&mut self, stmt: &'a Stmt) {
        // whenever we visit a new statement we initialize the current metadata
        self.current_stmt_meta.replace(StmtMetadata { isAwait: false, await_call: None });

        // continue visiting the AST
        visit_stmt(self, stmt);
        
        // if this statement has been visited, we know how to treat it
        let stmt_meta = self.current_stmt_meta.take().unwrap();
        if stmt_meta.isAwait {
            // detected an await position, increase the state number, everything
            // after this point goes to the next state
            self.current_state += 1;
            self.add_state(stmt_meta.await_call);
            // in case the result of the awaited call was assigned to a local to 
            // use it in subsequent statements we need to add this part as the first statement
            // in the new state. The concluded value is available as "result"
            match stmt {
                Stmt::Local(local) => {
                    //println!("assignment for awaited stmt found");
                    //println!("{:#?}", local);
                    // extract the original identifier and type from the assignment
                    // and use the awaited result as assignment expression
                    // from: let b: u32 = thinkable().await; --> to: let b: u32 = result;
                    match local {
                        Local {
                            let_token: Let,
                            pats,
                            ty: Some(
                                (
                                    Colon,
                                    path
                                )
                            ),
                            ..
                        } => {
                            // extract the identifier and adjust the assignment
                            let assignment = quote!(let #pats: #path = result;);
                            let tmp_stmt = syn::parse2(assignment).unwrap();
                            self.add_statement(tmp_stmt);
                        },
                        _ => ()
                    }
                }
                _ => ()
            }
        } else {
            let test = quote!(#stmt);
            let test = syn::parse2(test).unwrap();
            self.add_statement(test);
        }
    }
}
