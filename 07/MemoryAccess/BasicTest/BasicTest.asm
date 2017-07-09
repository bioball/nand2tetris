
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

// get register that we should pop into, store at @R13.
@0
D=A
@1
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

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

// get register that we should pop into, store at @R13.
@2
D=A
@2
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

//--------------------------------------


// *** pop Arg 1

// get register that we should pop into, store at @R13.
@1
D=A
@2
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

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

// get register that we should pop into, store at @R13.
@6
D=A
@3
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

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

// get register that we should pop into, store at @R13.
@5
D=A
@4
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

//--------------------------------------


// *** pop That 2

// get register that we should pop into, store at @R13.
@2
D=A
@4
D=D+M // set the target address of our popped value in D
@R13
M=D

@SP
M=M-1 // decrement stack pointer
A=M // set A to value contained at address referenced by stack pointer.
D=M // get the value at that address, store in D

// store our popped value in the target address.
@R13
A=M
M=D
      

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


// *** pop Temp 6

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


// *** arithmetic + ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M+D // get value at pointer address, and perform computation. Store value in M.

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


// *** arithmetic - ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M-D // get value at pointer address, and perform computation. Store value in M.

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


// *** arithmetic + ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M+D // get value at pointer address, and perform computation. Store value in M.

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** arithmetic - ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M-D // get value at pointer address, and perform computation. Store value in M.

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push Temp 6

@11
D=M

@SP
A=M
M=D

@SP
M=M+1
       

//--------------------------------------


// *** arithmetic + ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
M=M+D // get value at pointer address, and perform computation. Store value in M.

@SP
M=M+1 // Increment stack pointer.
    