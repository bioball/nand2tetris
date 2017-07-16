// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// variable that stores whether we're currently displaying black or not.
// 1 if black
// 0 if not
@current_black
M=0

(LOOP)
  
  // if key is pressed, jump to BLACK
  @KBD
  D=M
  @BLACK
  D;JNE

  // else, jump to WHITE
  @WHITE
  0;JMP

  (BLACK)

    // if current_black is already non-zero, this is a no-op and we can go back to our loop.
    @current_black
    D=M
    @LOOP
    D;JNE

    // initialize i, set it to 0
    @i
    M=0

    // set current_black to 1
    @current_black
    M=1

    // for each register in SCREEN, set it to -1
    (BLACKLOOP)
      // get the value of i
      @i
      D=M

      // Determine if i has reached the total number of registers we need to write to.
      @8192
      D=D-A;

      // If i has reached 8K, jump back to the parent loop
      @LOOP
      D;JEQ

      // get the value of i again
      @i
      D=M

      // access SCREEN[i], set it to -1
      @SCREEN
      A=A+D
      M=-1

      // increase i by 1
      @i
      M=M+1

      // repeat.
      @BLACKLOOP
      0;JMP


  (WHITE)
    // if current_black is already zero, this is a no-op and we can go back to our loop
    @current_black
    D=M
    @LOOP
    D;JEQ


    // initialize i, set it to 0
    @i
    M=0

    // set current_black to 0
    @current_black
    M=0

    (WHITELOOP)
      // get the value of i
      @i
      D=M

      // Determine if i has reached the total number of registers we need to write to.
      @8192
      D=D-A;

      // If i has reached 8K, jump back to the parent loop
      @LOOP
      D;JEQ

      // get the value of i again
      @i
      D=M

      // access SCREEN[i], set it to 0
      @SCREEN
      A=A+D
      M=0

      // increase i by 1
      @i
      M=M+1

      // repeat.
      @WHITELOOP
      0;JMP
