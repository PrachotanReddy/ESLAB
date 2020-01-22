	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=n1
	ldr r1,=n2
	ldr r6,=result
	ldr r2,[r0]
	ldr r3,[r1]
	mov r4,#0 ;quotient
	mov r5,#0 ;reminder
up	cmp r2,r3
	bcc store
	sub r2,r3
	add r4,#1
	b up
store	str r4,[r6],#4
	str r2,[r6]
STOP
	B STOP
n1 dcd 65
n2 dcd 10
	AREA mydata,DATA,READWRITE
result	dcd 0,0
	end