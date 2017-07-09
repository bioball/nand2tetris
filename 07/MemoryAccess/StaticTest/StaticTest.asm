
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


// *** pop Static 8

@SP
M=M-1
A=M
D=M

@StaticTest.vm.8
M=D
       

//--------------------------------------


// *** pop Static 3

@SP
M=M-1
A=M
D=M

@StaticTest.vm.3
M=D
       

//--------------------------------------


// *** pop Static 1

@SP
M=M-1
A=M
D=M

@StaticTest.vm.1
M=D
       

//--------------------------------------


// *** push Static 3

@StaticTest.vm.3
D=M

@SP
A=M
M=D

@SP
M=M+1
       

//--------------------------------------


// *** push Static 1

@StaticTest.vm.1
D=M

@SP
A=M
M=D

@SP
M=M+1
       

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


// *** push Static 8

@StaticTest.vm.8
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
    