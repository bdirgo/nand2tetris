// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
	@R3 	// line 0
	M=1
	@R2
	M=0
	@R0
	D=M
	@END
	D;JEQ 	// Jump if R0 is zero
	@R1
	D=M
	@END
	D;JEQ 	// Jump if R1 is zero
	@R1
	D=M 	// D = R1
	@R2
	M=D 	// R2 = R1
(LOOP)
	@R1 	// (LOOP) line LOOP
	D=M 	// D = R1
	@R2
	D=D+M 	// D = R1 + R2
	M=D 	// R2 = D
	@R3
	MD=M+1
	@R0
	D=M-D  	// D=D-R0
(END)
	@END
	D;JEQ  	// If D=0 goto END
	@LOOP
	0;JMP  	// Else Goto LOOP
