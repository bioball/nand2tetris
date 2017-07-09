
// *** push constant 3030

@3030
D=A // set D to 3030
@SP
A=M
M=D // set value at stack pointer's address to 3030
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop pointer 0

@SP
M=M-1
A=M
D=M

@3
M=D
       

//--------------------------------------


// *** push constant 3040

@3040
D=A // set D to 3040
@SP
A=M
M=D // set value at stack pointer's address to 3040
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop pointer 1

@SP
M=M-1
A=M
D=M

@4
M=D
       

//--------------------------------------


// *** push constant 32

@32
D=A // set D to 32
@SP
A=M
M=D // set value at stack pointer's address to 32
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop This 2

// get index 2 of the This segment, store in @3
@2
D=A
@3
D=D+M // set the target address of our popped value in D

// store the target address in R13.
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

@R13
A=M
M=D // store our popped value in the target address.
      

//--------------------------------------


// *** push constant 46

@46
D=A // set D to 46
@SP
A=M
M=D // set value at stack pointer's address to 46
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop That 6

// get index 6 of the That segment, store in @4
@6
D=A
@4
D=D+M // set the target address of our popped value in D

// store the target address in R13.
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

@R13
A=M
M=D // store our popped value in the target address.
      

//--------------------------------------


// *** push pointer 0

@3
D=M

@SP
A=M
M=D

@SP
M=M+1
       

//--------------------------------------


// *** push pointer 1

@4
D=M

@SP
A=M
M=D

@SP
M=M+1
       

//--------------------------------------


// *** add ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]. Add to D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
D=M+D // get value at pointer address, and add D to it. Store value in D.
M=D // store result back at register.

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push This 2

@2
D=A // Store 2 in D
@3
A=M+D // get address of base register for @3, and add 2 to it. Send to A.
D=M // Get the value of index 2 of This and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 2 position of This)

@SP
M=M+1 // Increment stack pointer
      

//--------------------------------------


// *** sub ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]. Add to D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M-D // get value at pointer address, and subtract D from it. Store value in M.

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push That 6

@6
D=A // Store 6 in D
@4
A=M+D // get address of base register for @4, and add 6 to it. Send to A.
D=M // Get the value of index 6 of That and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 6 position of That)

@SP
M=M+1 // Increment stack pointer
      

//--------------------------------------


// *** add ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]. Add to D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
D=M+D // get value at pointer address, and add D to it. Store value in D.
M=D // store result back at register.

@SP
M=M+1 // Increment stack pointer.
    