			.text
			.global _start

_start:
			LDR R0, =ARRAY //R0 points to array
			LDR R1, N //r1 contains the number of elements
			PUSH {R0, R1, LR} //push parameters and LR
			BL LOOPSTART //call subroutine
			LDR R0, [SP, #4] //get return value from stack
			STR R0, RESULT //store in memory
			LDR LR, [SP, #8] //restore LR
			ADD SP, SP, #12 //remove params from stack

END:		B END //infinite loooop!

LOOPSTART:	PUSH {R0-R3} //callee-save registers loopstart will use
			LDR R1, [SP, #20] //load param n from stack
			LDR R2, [SP, #16] //load param array from stack
			MOV R0, #0 //clear R0 (max)

LOOP:		LDR R3, [R2], #4 //get next value from array
			CMP R3, R0 //R3-R0
			BLT NEXTEL //if R3<R0, branch to nextel 
			MOV R0, R3 //update current max

NEXTEL:		SUBS R1, R1, #1 //decrement loop counter
			BGT LOOP //loop back if R1>0
			STR R0, [SP, #20] //store max on stack, replacing N
			POP {R0-R3} //restore registers
			BX LR //branch back where we started			

ARRAY:		.word	4, 5, 3, 6
			.word	1, 8, 2
N:			.word	7
RESULT:		.word	0
			.end

			
