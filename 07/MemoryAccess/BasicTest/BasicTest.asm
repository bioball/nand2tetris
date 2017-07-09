
// *** push constant 10

@10
D=A // set D to 10
@SP
A=M
M=D // set value at stack pointer's address to 10
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop Local 0

// get index 0 of the Local segment, store in @1
@0
D=A
@1
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


// *** push constant 21

@21
D=A // set D to 21
@SP
A=M
M=D // set value at stack pointer's address to 21
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 22

@22
D=A // set D to 22
@SP
A=M
M=D // set value at stack pointer's address to 22
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop Arg 2

// get index 2 of the Arg segment, store in @2
@2
D=A
@2
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


// *** pop Arg 1

// get index 1 of the Arg segment, store in @2
@1
D=A
@2
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


// *** push constant 36

@36
D=A // set D to 36
@SP
A=M
M=D // set value at stack pointer's address to 36
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop This 6

// get index 6 of the This segment, store in @3
@6
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


// *** push constant 42

@42
D=A // set D to 42
@SP
A=M
M=D // set value at stack pointer's address to 42
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 45

@45
D=A // set D to 45
@SP
A=M
M=D // set value at stack pointer's address to 45
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop That 5

// get index 5 of the That segment, store in @4
@5
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


// *** pop That 2

// get index 2 of the That segment, store in @4
@2
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


// *** push constant 510

@510
D=A // set D to 510
@SP
A=M
M=D // set value at stack pointer's address to 510
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop temp 6

@SP
M=M-1
A=M
D=M

@11
M=D
       

//--------------------------------------


// *** push Local 0

@0
D=A // Store 0 in D
@1
A=M+D // get address of base register for @1, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Local)

@SP
M=M+1 // Increment stack pointer
      

//--------------------------------------


// *** push That 5

@5
D=A // Store 5 in D
@4
A=M+D // get address of base register for @4, and add 5 to it. Send to A.
D=M // Get the value of index 5 of That and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 5 position of That)

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
    

//--------------------------------------


// *** push Arg 1

@1
D=A // Store 1 in D
@2
A=M+D // get address of base register for @2, and add 1 to it. Send to A.
D=M // Get the value of index 1 of Arg and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 1 position of Arg)

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


// *** push This 6

@6
D=A // Store 6 in D
@3
A=M+D // get address of base register for @3, and add 6 to it. Send to A.
D=M // Get the value of index 6 of This and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 6 position of This)

@SP
M=M+1 // Increment stack pointer
      

//--------------------------------------


// *** push This 6

@6
D=A // Store 6 in D
@3
A=M+D // get address of base register for @3, and add 6 to it. Send to A.
D=M // Get the value of index 6 of This and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 6 position of This)

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


// *** push temp 6

@11
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
    