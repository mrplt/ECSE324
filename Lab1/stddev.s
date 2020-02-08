			.text
			.global _start

_start:
			LDR R4, =RESULT //R4 points to the max. result location
			LDR R2, [R4, #4] //R2 points to the number of elements in the list
			ADD R3, R4, #8 //R3 points to the first number
			LDR R0, [R3]  //R0 holds the first number on the list
			LDR R5, [R3] //R5 holds the first number on the list, for minimum

LOOP:		SUBS R2, R2, #1 //decrement the loop counter
			BEQ DONE //end loop if counter reached 0
			ADD R3, R3, #4 //points to next number in the list 
			LDR R1, [R3] //holds the next number in the list
			CMP R0, R1 //Compares R0, R1 by doing R0-R1
			BGE LOOP //if R0-R1>0, go back to loop
			MOV R0, R1 //else, update the current max
			B LOOP //branch back to the loop

DONE:		STR R0, [R4] //store the max. result in memory location
			LDR R6, =RESULT //R6 points to the min. result location
			LDR R2, [R6, #4] //R2 points to the number of elements in the list			
			ADD R3, R6, #8 //R3 points to the first number	
			B MINLOOP //branches to MINLOOP	
		

MINLOOP:	SUBS R2, R2, #1 //decrement the loop counter
			BEQ DIVS //end loop if counter reached 0
			ADD R3, R3, #4 //points to next number in the list 
			LDR R1, [R3] //holds the next number in the list
			CMP R5, R1 //Compares R5, R1 by doing R5-R1
			BLT MINLOOP //if R5-R1<0, go back to loop
			MOV R5, R1 //else, update the current min
			B MINLOOP //branch back to the loop

DIVS:		STR R5, [R4] //stores the min result in memory location
			SUBS R9, R0, R5 //substitutes R5 (min) from R0 (max)
			LSR R10, R9, #2 //right shift by 2 bits; equivalent to division by 4
			STR R10, [R4] //stores the final result in memory location

END:		B END //infinite loop

RESULT:		.word	0
N:			.word	7
NUMBERS:	.word	4, 5, 3, 6
			.word	1, 8, 2
