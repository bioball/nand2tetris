
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
      
    


// *** pop pointer 1           // that = argument[1]


@SP
M=M-1
A=M
D=M

@THAT
M=D
       
    


// *** push constant 0


@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       
    


// *** pop that 0              // first element in the series = 0


// get register that we should pop into, store at @R13.
@0
D=A
@THAT
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
      
    


// *** push constant 1


@1
D=A // set D to 1
@SP
A=M
M=D // set value at stack pointer's address to 1
@SP
M=M+1 // increment stack pointer
       
    


// *** pop that 1              // second element in the series = 1


// get register that we should pop into, store at @R13.
@1
D=A
@THAT
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
      
    


// *** push constant 2


@2
D=A // set D to 2
@SP
A=M
M=D // set value at stack pointer's address to 2
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
    
    


// *** pop argument 0          // num_of_elements -= 2 (first 2 elements are set)


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
      
    


// *** label MAIN_LOOP_START


(MAIN_LOOP_START)
    
    


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
      
    


// *** if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT


@SP
M=M-1 // SP--
A=M
D=M // get the topmost value of the stack, and store it in D.
@COMPUTE_ELEMENT
D;JNE // if D is not 0, jump.
    
    


// *** goto END_PROGRAM        // otherwise, goto END_PROGRAM


@END_PROGRAM
0;JMP
    
    


// *** label COMPUTE_ELEMENT


(COMPUTE_ELEMENT)
    
    


// *** push that 0


@0
D=A // Store 0 in D
@THAT
A=M+D // get address of base register for @THAT, and add 0 to it. Send to A.
D=M // Get the value of index 0 of That and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 0 position of That)

@SP
M=M+1 // Increment stack pointer
      
    


// *** push that 1


@1
D=A // Store 1 in D
@THAT
A=M+D // get address of base register for @THAT, and add 1 to it. Send to A.
D=M // Get the value of index 1 of That and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 1 position of That)

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
    
    


// *** pop that 2              // that[2] = that[0] + that[1]


// get register that we should pop into, store at @R13.
@2
D=A
@THAT
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
      
    


// *** push pointer 1


@THAT
D=M

@SP
A=M
M=D

@SP
M=M+1
       
    


// *** push constant 1


@1
D=A // set D to 1
@SP
A=M
M=D // set value at stack pointer's address to 1
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
    
    


// *** pop pointer 1           // that += 1


@SP
M=M-1
A=M
D=M

@THAT
M=D
       
    


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
    
    


// *** pop argument 0          // num_of_elements--


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
      
    


// *** goto MAIN_LOOP_START


@MAIN_LOOP_START
0;JMP
    
    


// *** label END_PROGRAM


(END_PROGRAM)
    
    