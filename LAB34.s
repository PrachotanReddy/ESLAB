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
	ldrb r2,[r0]
	ldrb r3,[r1]
	mov r7,r2
	mov r8,r3
	
back cmp r2,r3
	beq exit
	bcs down
	sub r3,r2
	b back
down sub r2,r3
	b back
	
exit ldr r0,=gcd
	strb r3,[r0]
	
	ldr r6,=lcm
	mov r5,#0
	mul r7,r8 ;n1*n2
	ldr r4,[r0] ;r4=gcd
	cmp r4,#1
	beq prod 
up sub r7,r4
	add r5,#1
	cmp r7,#0
	bne up
	str r5,[r6]
	b stop
prod str r7,[r6]
stop
	b stop
n1 dcd 15
n2 dcd 10
	AREA mydata,data,readwrite
lcm dcd 0
gcd dcd 0
	end