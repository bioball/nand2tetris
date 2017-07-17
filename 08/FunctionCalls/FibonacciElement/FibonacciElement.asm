
// initialize SP to 256
@256
D=A
@SP
M=D


// push return address.
@$ret_0
D=A // get address that we should return to, store in D
@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer

// push LCL

@LCL
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push ARG

@ARG
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THIS

@THIS
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THAT

@THAT
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// ARG = SP - n - 5
@SP
D=M
@0
D=D-A // SP - n
@5
D=D-A // SP - n - 5
@ARG
M=D

// LCL = SP
@LCL
@SP
D=M
@LCL
M=D

// goto function
@Sys.init
0;JMP

// create label for return address
($ret_0)
    
    

// *** function Main.fibonacci 0


(Main.fibonacci)
// init local variables x 0.

    
    

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
       
    

// *** lt


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

@COMPARETRUE_3 // need to make these labels unique.
D;JLT // Jump based off comparison to D.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_3
0;JMP
(COMPARETRUE_3)
@SP
A=M
M=-1
(END_3)
@SP
M=M+1 // Increment stack pointer.
    
    

// *** if-goto IF_TRUE


@SP
M=M-1 // SP--
A=M
D=M // get the topmost value of the stack, and store it in D.
@Main.vm$IF_TRUE
D;JNE // if D is not 0, jump.
    
    

// *** goto IF_FALSE


@Main.vm$IF_FALSE
0;JMP
    
    

// *** label IF_TRUE


(Main.vm$IF_TRUE)
    
    

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
    
    

// *** label IF_FALSE


(Main.vm$IF_FALSE)
    
    

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
    
    

// *** call Main.fibonacci 1


// push return address.
@Main.vm$ret_13
D=A // get address that we should return to, store in D
@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer

// push LCL

@LCL
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push ARG

@ARG
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THIS

@THIS
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THAT

@THAT
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// ARG = SP - n - 5
@SP
D=M
@1
D=D-A // SP - n
@5
D=D-A // SP - n - 5
@ARG
M=D

// LCL = SP
@LCL
@SP
D=M
@LCL
M=D

// goto function
@Main.fibonacci
0;JMP

// create label for return address
(Main.vm$ret_13)
    
    

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
    
    

// *** call Main.fibonacci 1


// push return address.
@Main.vm$ret_17
D=A // get address that we should return to, store in D
@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer

// push LCL

@LCL
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push ARG

@ARG
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THIS

@THIS
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THAT

@THAT
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// ARG = SP - n - 5
@SP
D=M
@1
D=D-A // SP - n
@5
D=D-A // SP - n - 5
@ARG
M=D

// LCL = SP
@LCL
@SP
D=M
@LCL
M=D

// goto function
@Main.fibonacci
0;JMP

// create label for return address
(Main.vm$ret_17)
    
    

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
    
    

// *** function Sys.init 0


(Sys.init)
// init local variables x 0.

    
    

// *** push constant 4


@4
D=A // set D to 4
@SP
A=M
M=D // set value at stack pointer's address to 4
@SP
M=M+1 // increment stack pointer
       
    

// *** call Main.fibonacci 1


// push return address.
@Sys.vm$ret_2
D=A // get address that we should return to, store in D
@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer

// push LCL

@LCL
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push ARG

@ARG
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THIS

@THIS
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// push THAT

@THAT
D=M

@SP
A=M
M=D // put that address at the top of the stack
@SP
M=M+1 // increment stack pointer
    

// ARG = SP - n - 5
@SP
D=M
@1
D=D-A // SP - n
@5
D=D-A // SP - n - 5
@ARG
M=D

// LCL = SP
@LCL
@SP
D=M
@LCL
M=D

// goto function
@Main.fibonacci
0;JMP

// create label for return address
(Sys.vm$ret_2)
    
    

// *** label WHILE


(Sys.vm$WHILE)
    
    

// *** goto WHILE


@Sys.vm$WHILE
0;JMP
    
    