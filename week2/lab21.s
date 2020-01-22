	AREA RESET,DATA,DATA,READONLY
		EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=src
	mov r1,#10
	mov r2,#0
	mov r5,#0
	ldr r3,=dst
	mov r6,#0
lp1	ldr r4,[r0],#4
	adds r5,r6
	mov r6,#0
	adc r6,#0
	adds r5,r4
	adc r2,#0
	subs r1,#1
	bne lp1
	str r5,[r3]
STOP
	B STOP
src DCD 1,1,1,1,1,1,1,1,1,1
	AREA mydata,DATA,READWRITE
dst DCD 0
	END