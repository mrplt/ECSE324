			.text
			.global _start

_start:
			MOV R0, #4 //1 is to be pushed, in R0

PUSHST:		STR R0, [SP, #-4]! //pushes 1 onto the stack
			ADD R0, R0, #1 //adds 1 to R0
			STR R0, [SP, #-4]! //PUSHES 2 ONTO STACK
			ADD R0, R0, #1 //ADDS 1 TO R0
			STR R0, [SP, #-4]! //PUSHES 3 ONTO STACK

POPST:		LDR R0, [SP], #4 //POPS 3
			LDR R1, [SP], #4 //POPS 2
			LDR R2, [SP], #4 //POPS 1

END:		B END
