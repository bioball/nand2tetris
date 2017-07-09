
// *** push constant 111

@111
D=A // set D to 111
@SP
A=M
M=D // set value at stack pointer's address to 111
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 333

@333
D=A // set D to 333
@SP
A=M
M=D // set value at stack pointer's address to 333
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 888

@888
D=A // set D to 888
@SP
A=M
M=D // set value at stack pointer's address to 888
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** pop static 8

@SP
M=M-1
A=M
D=M

@Static.8
M=D
       

//--------------------------------------


// *** pop static 3

@SP
M=M-1
A=M
D=M

@Static.3
M=D
       

//--------------------------------------


// *** pop static 1

@SP
M=M-1
A=M
D=M

@Static.1
M=D
       

//--------------------------------------


// *** push static 3

@Static.3
D=M

@SP
A=M
M=D

@SP
M=M+1
       

//--------------------------------------


// *** push static 1

@Static.1
D=M

@SP
A=M
M=D

@SP
M=M+1
       

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


// *** push static 8

@Static.8
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
    