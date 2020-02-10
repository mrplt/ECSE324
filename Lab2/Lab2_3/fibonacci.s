			.text
			.global _start

_start:		LDR R1, COEFF //holds the coefficient
			PUSH {LR} //pushes LR to the stack
			BL FIBONR //branches to fibonr
			POP {LR} //pops from stack to LR
			STR R3, RESULT //stores the result
			B END

FIBONR:		CMP R1, #2 //R1(COEFF)-2
			BLE BASECASE //base case, when coefficient is 0 or 1
			SUBS R1, R1, #1 //equals to n-1
			PUSH {LR} //pushes LR to the stack
			BL FIBONR //branches to fibonr to calc n-1
			POP {LR} //pops from stack to LR
			PUSH {R0} //pushes Fibonacci(N-2) to the stack
			SUBS R1, R1, #1 //Subtracts 1 from R1 to calculate Fib(N-2)
			PUSH {LR} //pushes LR to stack
			BL FIBONR //branches to fibonr to calculate n-2
			POP {LR} //pops from stack to LR
			POP {R3} //pops the interim fibonacci nr
			ADD R1, R1, #2 //R1 is equal to N again
			ADD R0, R0, R3 //adds Fib(n-1)+Fib(n-2)
			BX LR //branches back to LR

BASECASE:	MOV R0, #1 //base case, equal to 1
			BX LR //branches back to LR


END:		B END

COEFF:		.word 11
RESULT:		.word 0
			.end
