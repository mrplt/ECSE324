			.text
			.global _start
_start:
			LDR R1, =N //R1 points to the number of elements
			LDR R0, [R1] //R0 holds the number of elements
			MOV R5, #0 //boolean value for sorted, 0 means false
			B FIRSTLOOP //branches to the first loop
			
FIRSTLOOP:	CMP R5, #1 //compares R5 with 1. if(sorted=true)
			BEQ END //if sorted=true, branch to done
			MOV R5, #1 //Set R5 to 1, sorted=true
			ADD R3, R1, #4 //R3 points to the first element
			LDR R2, [R3] //R2 holds the first element
			MOV R4, #2 //R4 holds 2, for loop increment
			B SECONDLOOP //branches to the second loop

SECONDLOOP:	CMP R0, R4 //compares the increment counter with n
			BEQ FIRSTLOOP //if i=n, branch back to first loop
			ADD R4, R4, #1 //increase the increment
			LDR R6, [R3] //R6 holds element i
			ADD R3, R3, #4 //R3 now points to the next element
			LDR R7, [R3] //R7 holds element i+1
			CMP R7, R6 //compares element i+1 and i
			BLT REPLACE //if i+1<i branch to replace
			B SECONDLOOP //go back to the loop

REPLACE:	STR R6, [R3] //R3 at points at (i+1)th element; we store i-th element there now
			SUBS R3, R3, #4 //subtract 4 from R3 so R3 points at the i-th element
			STR R7, [R3] //we store i-th element where the (i+1)th element was before
			ADD R3, R3, #4 //R3 points at (i+1)th element again
			MOV R5, #0 //sorted is false, as we made a change
			B SECONDLOOP //branch back to second loop
			
END:		B END //infinite loop!

N:			.word	8
NUMBERS:	.word	-40, 728, 3, 116
			.word	1, -18, -32, 47
