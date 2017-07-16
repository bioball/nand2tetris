
// *** label LOOP_START


(LOOP_START)
    
    


// *** push local 0


@0
D=A // Store 0 in D
@R1
A=M+D // get address of base register for @R1, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Local)

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
    
    


// *** push argument 0


@0
D=A // Store 0 in D
@R2
A=M+D // get address of base register for @R2, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Arg and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Arg)

@SP
M=M+1 // Increment stack pointer
      
    


// *** push constant 1


@1
D=A // set D to 1
@SP
A=M
M=D // set value at stack pointer's address to 1
@SP
M=M+1 // increment stack pointer
       
    


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
    
    


// *** push argument 0


@0
D=A // Store 0 in D
@R2
A=M+D // get address of base register for @R2, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Arg and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Arg)

@SP
M=M+1 // Increment stack pointer
      
    


// *** push local 0


@0
D=A // Store 0 in D
@R1
A=M+D // get address of base register for @R1, and add 0 to it. Send to A.
D=M // Get the value of index 0 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of Local)

@SP
M=M+1 // Increment stack pointer
      
    