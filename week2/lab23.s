	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA sub232,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=n1
	ldr r1,[r0]
	ldr r0,=n2
	ldr r3,[r0]
	subs r6,r1,r3
	ldr r2,=result
	str r6,[r2]
STOP
	B STOP
n1 dcd 3
n2 dcd 2
	AREA mydata,DATA,READWRITE
result dcd 0
	END
	