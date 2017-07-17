
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
    
    

// *** function Class1.set 0


(Class1.set)
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
      
    

// *** pop static 0


@SP
M=M-1
A=M
D=M

@Class1.vm.0
M=D
       
    

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
      
    

// *** pop static 1


@SP
M=M-1
A=M
D=M

@Class1.vm.1
M=D
       
    

// *** push constant 0


@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       
    

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
    
    

// *** function Class1.get 0


(Class1.get)
// init local variables x 0.

    
    

// *** push static 0


@Class1.vm.0
D=M

@SP
A=M
M=D

@SP
M=M+1
       
    

// *** push static 1


@Class1.vm.1
D=M

@SP
A=M
M=D

@SP
M=M+1
       
    

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
    
    

// *** function Class2.set 0


(Class2.set)
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
      
    

// *** pop static 0


@SP
M=M-1
A=M
D=M

@Class2.vm.0
M=D
       
    

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
      
    

// *** pop static 1


@SP
M=M-1
A=M
D=M

@Class2.vm.1
M=D
       
    

// *** push constant 0


@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       
    

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
    
    

// *** function Class2.get 0


(Class2.get)
// init local variables x 0.

    
    

// *** push static 0


@Class2.vm.0
D=M

@SP
A=M
M=D

@SP
M=M+1
       
    

// *** push static 1


@Class2.vm.1
D=M

@SP
A=M
M=D

@SP
M=M+1
       
    

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
    
    

// *** function Sys.init 0


(Sys.init)
// init local variables x 0.

    
    

// *** push constant 6


@6
D=A // set D to 6
@SP
A=M
M=D // set value at stack pointer's address to 6
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
       
    

// *** call Class1.set 2


// push return address.
@Sys.vm$ret_3
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
@2
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
@Class1.set
0;JMP

// create label for return address
(Sys.vm$ret_3)
    
    

// *** pop temp 0


@SP
M=M-1
A=M
D=M

@R5
M=D
       
    

// *** push constant 23


@23
D=A // set D to 23
@SP
A=M
M=D // set value at stack pointer's address to 23
@SP
M=M+1 // increment stack pointer
       
    

// *** push constant 15


@15
D=A // set D to 15
@SP
A=M
M=D // set value at stack pointer's address to 15
@SP
M=M+1 // increment stack pointer
       
    

// *** call Class2.set 2


// push return address.
@Sys.vm$ret_7
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
@2
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
@Class2.set
0;JMP

// create label for return address
(Sys.vm$ret_7)
    
    

// *** pop temp 0


@SP
M=M-1
A=M
D=M

@R5
M=D
       
    

// *** call Class1.get 0


// push return address.
@Sys.vm$ret_9
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
@Class1.get
0;JMP

// create label for return address
(Sys.vm$ret_9)
    
    

// *** call Class2.get 0


// push return address.
@Sys.vm$ret_10
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
@Class2.get
0;JMP

// create label for return address
(Sys.vm$ret_10)
    
    

// *** label WHILE


(Sys.vm$WHILE)
    
    

// *** goto WHILE


@Sys.vm$WHILE
0;JMP
    
    