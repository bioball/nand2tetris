
// *** push constant 16

@16
D=A // set D to 16
@SP
A=M
M=D // set value at stack pointer's address to 16
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 17

@17
D=A // set D to 17
@SP
A=M
M=D // set value at stack pointer's address to 17
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** comparison: JLT ***

// Get value of M[SP-1], store in R13
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.
@R13 // save to R13.
M=D

// Get value of M[SP-2]. Store in D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.
D=M
@R13
D=D-M // subtract M[SP-1] from M[SP-2]

@COMPARETRUE_2 // need to make these labels unique.
D;JLT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_2
0;JMP
(COMPARETRUE_2)
@SP
A=M
M=-1
(END_2)
@SP
M=M+1 // Increment stack pointer.
    