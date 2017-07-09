
// *** push constant 17

@17
D=A // set D to 17
@SP
A=M
M=D // set value at stack pointer's address to 17
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


// *** comparison: JEQ ***

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

@COMPARETRUE_9 // need to make these labels unique.
D;JEQ // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_9
0;JMP
(COMPARETRUE_9)
@SP
A=M
M=-1
(END_9)
@SP
M=M+1 // Increment stack pointer.
    

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


// *** push constant 16

@16
D=A // set D to 16
@SP
A=M
M=D // set value at stack pointer's address to 16
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** comparison: JEQ ***

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

@COMPARETRUE_12 // need to make these labels unique.
D;JEQ // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_12
0;JMP
(COMPARETRUE_12)
@SP
A=M
M=-1
(END_12)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


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


// *** comparison: JEQ ***

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

@COMPARETRUE_15 // need to make these labels unique.
D;JEQ // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_15
0;JMP
(COMPARETRUE_15)
@SP
A=M
M=-1
(END_15)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 892

@892
D=A // set D to 892
@SP
A=M
M=D // set value at stack pointer's address to 892
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 891

@891
D=A // set D to 891
@SP
A=M
M=D // set value at stack pointer's address to 891
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

@COMPARETRUE_18 // need to make these labels unique.
D;JLT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_18
0;JMP
(COMPARETRUE_18)
@SP
A=M
M=-1
(END_18)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 891

@891
D=A // set D to 891
@SP
A=M
M=D // set value at stack pointer's address to 891
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 892

@892
D=A // set D to 892
@SP
A=M
M=D // set value at stack pointer's address to 892
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

@COMPARETRUE_21 // need to make these labels unique.
D;JLT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_21
0;JMP
(COMPARETRUE_21)
@SP
A=M
M=-1
(END_21)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 891

@891
D=A // set D to 891
@SP
A=M
M=D // set value at stack pointer's address to 891
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 891

@891
D=A // set D to 891
@SP
A=M
M=D // set value at stack pointer's address to 891
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

@COMPARETRUE_24 // need to make these labels unique.
D;JLT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_24
0;JMP
(COMPARETRUE_24)
@SP
A=M
M=-1
(END_24)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 32767

@32767
D=A // set D to 32767
@SP
A=M
M=D // set value at stack pointer's address to 32767
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 32766

@32766
D=A // set D to 32766
@SP
A=M
M=D // set value at stack pointer's address to 32766
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** comparison: JGT ***

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

@COMPARETRUE_27 // need to make these labels unique.
D;JGT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_27
0;JMP
(COMPARETRUE_27)
@SP
A=M
M=-1
(END_27)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 32766

@32766
D=A // set D to 32766
@SP
A=M
M=D // set value at stack pointer's address to 32766
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 32767

@32767
D=A // set D to 32767
@SP
A=M
M=D // set value at stack pointer's address to 32767
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** comparison: JGT ***

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

@COMPARETRUE_30 // need to make these labels unique.
D;JGT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_30
0;JMP
(COMPARETRUE_30)
@SP
A=M
M=-1
(END_30)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 32766

@32766
D=A // set D to 32766
@SP
A=M
M=D // set value at stack pointer's address to 32766
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 32766

@32766
D=A // set D to 32766
@SP
A=M
M=D // set value at stack pointer's address to 32766
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** comparison: JGT ***

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

@COMPARETRUE_33 // need to make these labels unique.
D;JGT // subtract that value from D, and compared to zero. Jump based on comparison.
// if we reach here, the comparison has failed.
@SP
A=M
M=0
@END_33
0;JMP
(COMPARETRUE_33)
@SP
A=M
M=-1
(END_33)
@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 57

@57
D=A // set D to 57
@SP
A=M
M=D // set value at stack pointer's address to 57
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 31

@31
D=A // set D to 31
@SP
A=M
M=D // set value at stack pointer's address to 31
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** push constant 53

@53
D=A // set D to 53
@SP
A=M
M=D // set value at stack pointer's address to 53
@SP
M=M+1 // increment stack pointer
       

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
    

//--------------------------------------


// *** push constant 112

@112
D=A // set D to 112
@SP
A=M
M=D // set value at stack pointer's address to 112
@SP
M=M+1 // increment stack pointer
       

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


// *** flip: - ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
M=-M // flip it!

@SP
M=M+1 // increment stack pointer.
    

//--------------------------------------


// *** combination: & ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]. Add to D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.

//
D=M&D
@SP
A=M
M=D

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** push constant 82

@82
D=A // set D to 82
@SP
A=M
M=D // set value at stack pointer's address to 82
@SP
M=M+1 // increment stack pointer
       

//--------------------------------------


// *** combination: | ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
D=M // Get value at pointer address, store in D.

// Get value of M[SP-2]. Add to D.
@SP
M=M-1 // Decrement stack pointer.
A=M // get address of pointer, store in A.

//
D=M|D
@SP
A=M
M=D

@SP
M=M+1 // Increment stack pointer.
    

//--------------------------------------


// *** flip: ! ***

// Get value of M[SP-1], store in D
@SP
M=M-1 // Decrement stack pointer.
A=M // Get address of pointer, store in A.
M=!M // flip it!

@SP
M=M+1 // increment stack pointer.
    