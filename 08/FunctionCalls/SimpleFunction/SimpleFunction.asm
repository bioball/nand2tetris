
// *** function SimpleFunction.test 2


(SimpleFunction.test)

// set @LCL to current SP location.
@SP
D=M
@LCL
M=D

// init local variables x 2.
A=M // initialize A so that M refers to the memory address on the top of our stack.

M=0
A=A+1
    

M=0
A=A+1
    

// after initializing all the local variables, we need to reposition the stack pointer to be above the new local segment.
@2
D=A
@SP
M=M+D // increment stack pointer by 2
    
    


// *** push local 0


@0
D=A // Store 0 in D
@LCL
A=M+D // get address of base register for @LCL, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Local)

@SP
M=M+1 // Increment stack pointer
      
    


// *** push local 1


@1
D=A // Store 1 in D
@LCL
A=M+D // get address of base register for @LCL, and add 1 to it. Send to A.
D=M // Get the value of index 1 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 1 position of Local)

@SP
M=M+1 // Increment stack pointer
      
    


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
    
    


// *** not


// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
M=!M // flip it!

@SP
M=M+1 // increment stack pointer.
    
    


// *** push argument 0


@0
D=A // Store 0 in D
@ARG
A=M+D // get address of base register for @ARG, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Arg and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Arg)

@SP
M=M+1 // Increment stack pointer
      
    


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
    
    


// *** push argument 1


@1
D=A // Store 1 in D
@ARG
A=M+D // get address of base register for @ARG, and add 1 to it. Send to A.
D=M // Get the value of index 1 of Arg and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 1 position of Arg)

@SP
M=M+1 // Increment stack pointer
      
    


// *** sub


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
    
    


// *** return


// FRAME = LCL.
// we'll use R15 as FRAME.
@LCL
D=M
@R15
M=D

// RET = *(FRAME - 5).
// we'll use R14 as RET.
@5
D=A
@R15
A=M-D
D=M // D = *(FRAME - 5)

@R14
M=D // @R14 is RET.

// pop arg 0

// get register that we should pop into, store at @R13.
@0
D=A
@ARG
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
      

// SP = ARG + 1
@ARG
D=M
@SP
M=D+1


// @THAT = *(FRAME-1)
@1
D=A
@R15
A=M-D
D=M // D = *(FRAME-1)
@THAT
M=D
    

// @THIS = *(FRAME-2)
@2
D=A
@R15
A=M-D
D=M // D = *(FRAME-2)
@THIS
M=D
    

// @ARG = *(FRAME-3)
@3
D=A
@R15
A=M-D
D=M // D = *(FRAME-3)
@ARG
M=D
    

// @LCL = *(FRAME-4)
@4
D=A
@R15
A=M-D
D=M // D = *(FRAME-4)
@LCL
M=D
    

// goto RET
@R14
A=M
0;JMP
    
    