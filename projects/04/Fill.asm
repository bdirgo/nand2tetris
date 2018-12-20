// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// for (i=0; i<n; i++) { arr[i]=0; }
// arr = 16384 and n=8192
//		ADDRESS  VALUE
// arr	|	16		|	16384	|
// n	|	17		|	8192	|
// i	|	18		|	0		|
// ...	|	...		|	0		|
// 		|	16384	|	0		| (Start of `arr`)
//  	|	16385	|	0		|
//  	|	16386	|	0		|
// ...	|	...		|	0		|

(KEYBAORD)
	@24576 		// Keyboard mem map
	D=M
	@BLACK
	D;JNE 		// If the Keybaord is not Zero go to BLACK
	@WHITE
	D;JEQ 		//IF Keyboard is zero go to white

(WHITE)
	//arr = 16384
	@16384
	D=A
	@arr
	M=D

	//n = 8192
	@8192
	D=A
	@n
	M=D

	//init i=0
	@i
	M=0
(WHITELOOP)
	//if i==n goto END
	@i
	D=M
	@n
	D=D-M
	@END
	D;JEQ

	//RAM[arr+i] = 0
	@arr
	D=M
	@i
	A=D+M
	M=0

	//i++
	@i
	M=M+1

	@WHITELOOP
	0;JMP

(BLACK)

	//arr = 16384
	@16384
	D=A
	@arr
	M=D

	//n = 8192
	@8192
	D=A
	@n
	M=D

	//init i=0
	@i
	M=0
(BLACKLOOP)
	//if i==n goto END
	@i
	D=M
	@n
	D=D-M
	@END
	D;JEQ

	//RAM[arr+i] = -1
	@arr
	D=M
	@i
	A=D+M
	M=-1

	//i++
	@i
	M=M+1

	@BLACKLOOP
	0;JMP

(END)
	@0
	0;JMP
