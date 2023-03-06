	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"Practica.c"

.section .data
buffer:
	.space	8
buffer_out:
	.space	8

	.text
	.align	1
	.global	userInput
	.syntax unified
	.thumb
	.thumb_func
	.type	userInput, %function
userInput:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	# prologo
	push	{r7}			@ creación del marco de userInput
	sub		sp, sp, #12		@ ajusta el tamaño del marco 
	add		r7, sp, #0		@ actualiza el puntero del marco
	str		r0, [r7]		@ resguardo de los argumentos
	str 	r1, [r7, #4]	
	# cuerpo de la funcion
	ldr 	r2, [r7, #4]
	ldr 	r1, [r7]
	mov 	r0, #0			
	mov 	r7, #3			@ carga de los argumentos de read
	svc 	0x0				@ llamado al sistema
	mov		r3, r0
	add		r7, sp, #0
	# epilogo
	mov		r0, r3			@ return 
	adds	r7, r7, #12		@ restauración del marco de main
	mov		sp, r7
	pop	{r7}
	bx	lr		
	@ regreso a main
	.size	userInput, .-userInput
	.align	1
	.global	asciiInt
	.syntax unified
	.thumb
	.thumb_func
	.type	asciiInt, %function
asciiInt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L4
.L5:
	ldr	r2, [r7, #8]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, r1
	subs	r3, r3, #48
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L4:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	asciiInt, .-asciiInt
	.align	1
	.global	arrayAdd
	.syntax unified
	.thumb
	.thumb_func
	.type	arrayAdd, %function
arrayAdd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L8
.L9:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L8:
	ldr	r3, [r7, #12]
	cmp	r3, #4
	ble	.L9
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	arrayAdd, .-arrayAdd
	.align	1
	.global	intAscii
	.syntax unified
	.thumb
	.thumb_func
	.type	intAscii, %function
intAscii:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	uxtb	r3, r3
	adds	r3, r3, #48
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	intAscii, .-intAscii
	.align	1
	.global	userOutput
	.syntax unified
	.thumb
	.thumb_func
	.type	userOutput, %function
userOutput:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	# prologo
	push	{r7}			@ creación del marco de userOutput
	sub		sp, sp, #12		@ ajusta el tamaño del marco 
	add		r7, sp, #0		@ actualiza el puntero del marco
	str		r0, [r7]		@ resguarda de los argumentos
	str 	r1, [r7, #4]
	# cuerpo de la funcion
	ldr 	r2, [r7, #4]	
	ldr 	r1, [r7]
	mov 	r0, #0x1
	mov 	r7, #0x4		@ carga de los argumentos de write
	svc 	0x0				@ llamado al sistema
	mov		r3, r0
	add		r7, sp, #0
    # epilogo 
	mov		r0, r3			@ return 
	adds	r7, r7, # 12	@ restauración del marco de main
	mov		sp, r7
	pop		{r7}
	bx		lr				@ regreso a main
	.size	userOutput, .-userOutput
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	ldr	r3, .L19
	ldr	r3, [r3]
	str	r3, [r7, #36]
	mov	r3, #0
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L15
.L16:
	movs r1, #0x1
	ldr	r0, =buffer
	bl	userInput
	str	r0, [r7, #12]
	ldr	r1, [r7, #12]
	ldr	r0, =buffer
	bl	asciiInt
	mov	r2, r0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	adds	r3, r3, #40
	add	r3, r3, r7
	str	r2, [r3, #-24]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L15:
	ldr	r3, [r7, #4]
	cmp	r3, #4
	ble	.L16
	add	r3, r7, #16
	mov	r0, r3
	bl	arrayAdd
	str	r0, [r7, #8]
	movs	r2, #20
	ldr	r1, =buffer_out
	ldr	r0, [r7, #8]
	bl	intAscii
	str	r0, [r7, #12]
	ldr	r1, [r7, #12]
	ldr	r0, =buffer_out
	bl	userOutput
	movs	r3, #0
	ldr	r2, .L19
	ldr	r1, [r2]
	ldr	r2, [r7, #36]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L18
	bl	__stack_chk_fail
.L18:
	mov	r0, r3
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	__stack_chk_guard
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
