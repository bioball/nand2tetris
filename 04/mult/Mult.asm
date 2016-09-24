// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    // initialize i as 0
    @i
    M=0

    // initialize result as 0
    @result
    M=0

(LOOP)

    // get the value of i
    @i
    D=M

    // Determine whether i has reached register 1
    @R1
    D=M-D

    // if so, jump to end.
    @END
    D;JEQ
    
    // grab the value of R0 and store it in D
    @R0
    D=M

    // add D to result
    @result
    D=D+M

    // store the result
    @result
    M=D

    // increase i by 1.
    @i
    M=M+1

    // loop.
    @LOOP
    0;JMP

(END)
    // access result and store it in D
    @result
    D=M
    // Set register 2 to D
    @R2
    M=D
    (TERM)
    @TERM
    0;JMP