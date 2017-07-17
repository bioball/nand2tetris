
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
    
    

// *** function Sys.init 0


(Sys.init)
// init local variables x 0.

    
    

// *** push constant 4000	// test THIS and THAT context save


@4000
D=A // set D to 4000
@SP
A=M
M=D // set value at stack pointer's address to 4000
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 0


@SP
M=M-1
A=M
D=M

@THIS
M=D
       
    

// *** push constant 5000


@5000
D=A // set D to 5000
@SP
A=M
M=D // set value at stack pointer's address to 5000
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 1


@SP
M=M-1
A=M
D=M

@THAT
M=D
       
    

// *** call Sys.main 0


// push return address.
@Sys.init$ret_12
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
@Sys.main
0;JMP

// create label for return address
(Sys.init$ret_12)
    
    

// *** pop temp 1


@SP
M=M-1
A=M
D=M

@R6
M=D
       
    

// *** label LOOP


(Sys.init$LOOP)
    
    

// *** goto LOOP


@Sys.init$LOOP
0;JMP
    
    

// *** function Sys.main 5


(Sys.main)
// init local variables x 5.

@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       

@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       

@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       

@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       

@0
D=A // set D to 0
@SP
A=M
M=D // set value at stack pointer's address to 0
@SP
M=M+1 // increment stack pointer
       
    
    

// *** push constant 4001


@4001
D=A // set D to 4001
@SP
A=M
M=D // set value at stack pointer's address to 4001
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 0


@SP
M=M-1
A=M
D=M

@THIS
M=D
       
    

// *** push constant 5001


@5001
D=A // set D to 5001
@SP
A=M
M=D // set value at stack pointer's address to 5001
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 1


@SP
M=M-1
A=M
D=M

@THAT
M=D
       
    

// *** push constant 200


@200
D=A // set D to 200
@SP
A=M
M=D // set value at stack pointer's address to 200
@SP
M=M+1 // increment stack pointer
       
    

// *** pop local 1


// get register that we should pop into, store at @R13.
@1
D=A
@LCL
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
      
    

// *** push constant 40


@40
D=A // set D to 40
@SP
A=M
M=D // set value at stack pointer's address to 40
@SP
M=M+1 // increment stack pointer
       
    

// *** pop local 2


// get register that we should pop into, store at @R13.
@2
D=A
@LCL
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
      
    

// *** push constant 6


@6
D=A // set D to 6
@SP
A=M
M=D // set value at stack pointer's address to 6
@SP
M=M+1 // increment stack pointer
       
    

// *** pop local 3


// get register that we should pop into, store at @R13.
@3
D=A
@LCL
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
      
    

// *** push constant 123


@123
D=A // set D to 123
@SP
A=M
M=D // set value at stack pointer's address to 123
@SP
M=M+1 // increment stack pointer
       
    

// *** call Sys.add12 1


// push return address.
@Sys.main$ret_37
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
@Sys.add12
0;JMP

// create label for return address
(Sys.main$ret_37)
    
    

// *** pop temp 0


@SP
M=M-1
A=M
D=M

@R5
M=D
       
    

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
      
    

// *** push local 2


@2
D=A // Store 2 in D
@LCL
A=M+D // get address of base register for @LCL, and add 2 to it. Send to A.
D=M // Get the value of index 2 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 2 position of Local)

@SP
M=M+1 // Increment stack pointer
      
    

// *** push local 3


@3
D=A // Store 3 in D
@LCL
A=M+D // get address of base register for @LCL, and add 3 to it. Send to A.
D=M // Get the value of index 3 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 3 position of Local)

@SP
M=M+1 // Increment stack pointer
      
    

// *** push local 4


@4
D=A // Store 4 in D
@LCL
A=M+D // get address of base register for @LCL, and add 4 to it. Send to A.
D=M // Get the value of index 4 of Local and store as D.

@SP
A=M // Get SP's current address
M=D // set value of current SP address to D (which is 4 position of Local)

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
    
    

// *** function Sys.add12 0


(Sys.add12)
// init local variables x 0.

    
    

// *** push constant 4002


@4002
D=A // set D to 4002
@SP
A=M
M=D // set value at stack pointer's address to 4002
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 0


@SP
M=M-1
A=M
D=M

@THIS
M=D
       
    

// *** push constant 5002


@5002
D=A // set D to 5002
@SP
A=M
M=D // set value at stack pointer's address to 5002
@SP
M=M+1 // increment stack pointer
       
    

// *** pop pointer 1


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
      
    

// *** push constant 12


@12
D=A // set D to 12
@SP
A=M
M=D // set value at stack pointer's address to 12
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
    
    