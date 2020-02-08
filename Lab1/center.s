			.text
			.global _start

_start:
			LDR R4, =RESULT //R4 points to the result location
			LDR R2, [R4, #4] //R2 points to the number of elements in the list
			ADD R3, R4, #8 //R3 points to the first number
			LDR R0, [R3]  //R0 holds the first number on the list

ADDLOOP:	SUBS R2, R2, #1 //decrement the loop counter
			BEQ DONE //end loop if counter reached 0
			ADD R3, R3, #4 //points to next number in the list 
			LDR R1, [R3] //holds the next number in the list
			ADD R0, R0, R1 //Adds the current element
			B ADDLOOP //branch back to the loop

DONE:		STR R0, [R4] //Store the sum in R0
			LDR R4, =N //R4 points to N
			LDR R1, [R4] //R1 holds the number of elements
			MOV R3, #0 //variable for log2(N); to determine the number of bits to shift
			B AVGDONE //added all elements, branch to AVGDONE

AVGDONE:	LSR R1, R1, #1 //shifts it by one bit, equivalent to division by 2
			CMP R1, #0 //compares the shifted number with 0; to get its power to 2 (8=2^3)
			BEQ DIV //if 0, branch to Div
			ADD R3, R3, #1 //increments the counter for the power
			B AVGDONE //branch back to AVGDONE
			

DIV:		LSR R0, R0, R3 //shifts the sum of elements by R3 bits (if 8 elements, shifted by 3)
			LDR R4, =RESULT //R4 points to the result location 
			LDR R2, [R4, #4] //R2 points to the number of elements in the list
			ADD R2, R2, #1 //we increase R2 by 1 as we decrease it in SUBSLOOP by 1 before checking if it's equal to 0
			ADD R3, R4, #8 //R3 points to the first number
			LDR R1, [R3]  //R1 holds the first number on the list
			B SUBSLOOP //branches to Subsloop

SUBSLOOP:	SUBS R2, R2, #1 //decrement the loop counter
			BEQ END //end loop if counter reached 0
			SUBS R8, R1, R0 //subtracts the average from current number
			STR R8, [R3] //stores the new value at the address of the old number in NUMBERS
			ADD R3, R3, #4 //points to next number in the list 
			LDR R1, [R3] //holds the next number in the list
			B SUBSLOOP //branch back to the loop

END:		B END //infinite loop!

RESULT:		.word	0
N:			.word	8
NUMBERS:	.word	-40, 556, -321, 6
			.word	1, 8, 2, 7
