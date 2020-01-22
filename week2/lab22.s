	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA add128,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=n1
	ldr r1,=n2
	ldr r2,[r0]
	ldr r3,[r1]
	ldr r4,=dst
	mov r5,#4
	mov r6,#0
up	ADDS r2,r6
	mov r6,#0
	adc r6,#0
	adds r2,r3
	adc r6,#0
	str r2,[r4],#4
	ldr r2,[r0,#4]!
	ldr r3,[r1,#4]!
	subs r5,#1
	bne up
	str r6,[r4]
stop
	b stop
n1 dcd 1,2,3,5
n2 dcd 1,2,3,5
	AREA mydata,DATA,READWRITE
dst dcd 0
	END