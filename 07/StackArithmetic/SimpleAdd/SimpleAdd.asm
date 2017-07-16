
// *** push constant 7


@7
D=A // set D to 7
@SP
A=M
M=D // set value at stack pointer's address to 7
@SP
M=M+1 // increment stack pointer
       
    


// *** push constant 8


@8
D=A // set D to 8
@SP
A=M
M=D // set value at stack pointer's address to 8
@SP
M=M+1 // increment stack pointer
       
    


// *** add


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
    
    