			.text
			.global _start

_start:
			LDR R4, =RESULT //R4 points to the max. result location
			LDR R2, [R4, #4] //R2 points to the number of elements in the list
			ADD R3, R4, #8 //R3 points to the first number
			LDR R0, [R3]  //R0 holds the first number on the list

LOOP:		SUBS R2, R2, #1 //decrement the loop counter
			BEQ DONE //end loop if counter reached 0
			ADD R3, R3, #4 //points to next number in the list 
			LDR R1, [R3] //holds the next number in the list
			CMP R0, R1 //Compares R0, R1 by doing R0-R1
			BGE LOOP //if R0-R1>0, go back to loop
			MOV R0, R1 //else, update the current max
			B LOOP //branch back to the loop
			
DONE:		STR R0, [R4] //result is stored at the address R4 (RESULT)

END:		B END //infinite loop!

RESULT:		.word	0
N:			.word	7
NUMBERS:	.word	4, 5, 3, 6
			.word	1, 8, 2

