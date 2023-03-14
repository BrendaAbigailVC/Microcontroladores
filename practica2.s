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

.section .data
num1:
	.skip 8
num2:
	.skip 8
num3:
	.skip 8
num4:
	.skip 8
num5:
    .skip 8
suma:
    .skip 8

.section .text

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
	# Prologo
	push	{r7}			@ creación del marco de userInput
	sub		sp, sp, #12		@ ajusta el tamaño del marco 
	add		r7, sp, #0		@ actualiza el puntero del marco
	str		r0, [r7]		@ resguarda la direccion base del buffer
	str 	r1, [r7, #4]	@ resguarda el tamaño del buffer
	# Cuerpo de la funcion
	ldr 	r2, [r7, #4]	@ carga el tamaño del buffer
	ldr 	r1, [r7]		@ carga la direccion base del buffer
	mov 	r0, #0x0		@ indica el tipo de llamado STDIN
	mov 	r7, #0X3		@ indica el llamado al sistema del tipo read
	svc 	0x0				@ llamado al sistema
	mov		r3, r0			@ guarda el numero leido en caracteres
	add		r7, sp, #0		@ regresa r7 
	# Epilogo
	mov		r0, r3			@ return 
	adds	r7, r7, #12		@ restauración del marco de userInput
	mov		sp, r7			@ regresa el valor original del stack pointer
	pop	{r7}				@ regresa el valor orginal de r7
	bx	lr					@ regreso a main
	.size	userInput, .-userInput

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
	# Prologo
	push	{r7}			@ creación del marco de userOutput
	sub		sp, sp, #12		@ ajusta el tamaño del marco 
	add		r7, sp, #0		@ actualiza el puntero del marco
	str		r0, [r7]		@ resguarda de los argumentos
	str 	r1, [r7, #4]	@ resguarda el tamaño del buffer
	# Cuerpo de la funcion
	ldr 	r2, [r7, #4]	@ carga el tamaño del buffer
	ldr 	r1, [r7]		@ carga la direccion base del buffer
	mov 	r0, #0x1		@ indica el tipo de llamado STDOUT
	mov 	r7, #0x4		@ carga de los argumentos de write
	svc 	0x0				@ llamado al sistema
	mov		r3, r0			@ guarda el numero leido en caracteres
	add		r7, sp, #0		@ regresa r7 
    # Epilogo 
	mov		r0, r3			@ return 
	adds	r7, r7, # 12	@ restauración del marco de main
	mov		sp, r7			@ regresa el valor original del stack pointer
	pop		{r7}			@ regresa el valor orginal de r7
	bx		lr				@ regreso a main
    .size	userOutput, .-userOutput

	.global	asciiInt
	.syntax unified
	.thumb
	.thumb_func
	.type	asciiInt, %function
asciiInt:
    @ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
    # Prologo			
	push	{r7}				@ creación del marco de asciiInt
	sub		sp, sp, #24			@ ajusta el tamaño del marco 
	add		r7, sp, #0			@ actualiza el puntero del marco
	
    # Cuerpo de la funcion
	mov 	r3, r0
	str 	r3, [r7, #4]		@ guardamos el argumento en memoria
	ldr 	r1, [r7, #4]		@ cargamos el argumento

	mov 	r3, #0x0			@ contador de la longitud de la cadena 
	str 	r3, [r7, #8]
	ldr 	r2, [r7, #8]

	mov 	r3, #0x0			@ estado final del valor del contador	
	str 	r3, [r7, #12]
	ldr 	r4, [r7, #12]

    mov 	r3, #1 				@ indica la posicion de la decena en donde nos encontramos, es decir que indica el la cifra actual por la cual multiplicaremos
    str 	r3, [r7, #16]
	ldr 	r5, [r7, #16]

	mov 	r3, #10				@ variable para multiplicar por 10
	str 	r3, [r7, #20]
	ldr 	r6, [r7, #20]
_longitud_cadena:
	ldrb 	r9, [r1] 			@ carga lo contenido en el argumento en r8
    cmp 	r9, #0xa
    beq _contador 
    add 	r1, r1, #1
    add 	r2, r2, #1
    b _longitud_cadena

_contador: 
    sub 	r1, r1, #1
    ldrb 	r9, [r1]
    sub 	r9, r9, #0x30
    mul 	r8, r9, r5
    mov 	r9, r8
    mul 	r8, r5, r6 
    mov 	r5, r8
    add 	r4, r4, r9
    sub 	r2, r2, #1
    cmp 	r2, #0x0
    beq _salida
    b _contador
_salida:
	mov 	r3, r4
    mov 	r0, r3			@ return
	adds	r7, r7, #24		@ restauración del marco de main
	mov		sp, r7			@ regresa el valor original del stack pointer
	pop	{r7}				@ regresa el valor orginal de r7
	bx	lr					@ regresa al main
    .size	asciiInt, .-asciiInt

	.align	1
	.global	intAscii
	.syntax unified
	.thumb
	.thumb_func
	.type	intAscii, %function
intAscii:
    @ args = 0, pretend = 0, fr1me = 24
	@ fr1me_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
    # Prologo
	push	{r7}			@ creación del marco de intAscii
	sub	sp, sp, #24		@ ajusta el tamaño del marco
	add	r7, sp, #0			@ actualiza el puntero del marco
    # Cuerpo de la funcion
	mov r3, r0        	
    str r3, [r7, #4]			@ guardamos el argumento en memoria
	ldr r0, [r7, #4]			@ cargamos el argumento

	mov r3, #0x0        	
    str r3, [r7, #12]		@ Contador
	ldr r1, [r7, #12]


    mov r3, #1000       	
    str r3, [r7, #16]		@ Lugar actual
    ldr r2, [r7, #16]     	

    mov r3, #10 
    str r3,[r7, #20]		@ Divisor
    ldr r4,[r7, #20]

_loop:
    mov 	r5, #0x0
    udiv 	r5, r0, r2
    add 	r5, r5,  #0x30  @ Covertimos a ascii

    ldr 	r6, =suma       @ Almacenamos el ascci
    add 	r6, r6, r1      
    strb 	r5, [r6]
    add 	r1, r1, #1

    sub		r5, r5, #0x30 
    mul 	r8, r5, r2
    sub 	r0, r0, r8
    udiv 	r8, r2, r4		@ Dividir entre 10
    mov 	r2, r8
    cmp 	r2, #0
    beq 	_leave_int 
    b 		_loop

_leave_int:
    mov 	r5, #0xa 
    ldr 	r6, =suma
    add 	r6, r6, r1
    add 	r6, r6, #1
    strb 	r4, [r6]
    # epilogo
	adds	r7, r7, #24		@ restaur1ción del marco de userOutput
	mov		sp, r7			@ regresa el valor original del stack pointer
	@ sp needed				
	pop	{r7}				@ regresa el valor orginal de r7
	bx	lr					@ regresa a main
    .size	intAscii, .-intAscii


	.align	1
	.global	arr1yAdd
	.syntax unified
	.thumb
	.thumb_func
	.type	arr1yAdd, %function
arrayAdd:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	# Prologo
	push	{r7}				@ creación del marco de arrayAdd
	sub		sp, sp, #20			@ ajusta el tamaño del marco
	add		r7, sp, #0			@ actualiza el puntero del marco
	# Cuerpo de la funcion		
	str		r0, [r7, #4]		@ resguardo de *array en la pila
	movs	r3, #0			
	str		r3, [r7, #12]		@ guardado de result en la pila
	movs	r3, #0
	str		r3, [r7, #8]		@ guarda int i
	b	.L2					    
.L3:
	ldr		r3, [r7, #8]
	lsls	r3, r3, #2
	ldr		r2, [r7, #4]
	add		r3, r3, r2
	ldr		r3, [r3]
	ldr		r2, [r7, #12]
	add		r3, r3, r2
	str		r3, [r7, #12]
	ldr		r3, [r7, #8]
	adds	r3, r3, #1
	str		r3, [r7, #8]
.L2:
	ldr		r3, [r7, #8]
	cmp		r3, #4
	ble	.L3					@ salto dentro del for
	ldr		r3, [r7, #12]
	# Epilogo 
	mov		r0, r3				@ return result
	adds	r7, r7, #20		@ restauración del marco de main
	mov	sp, r7				@ regresa el valor original del stack pointer
	@ sp needed				
	pop	{r7}				@ regresa el valor orginal de r7
	bx	lr					@ regreso al main
	.size	arrayAdd, .-arrayAdd


	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
    @ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}		@ creacion del marco de main
	sub	sp, sp, #24			@ ajusta el tamaño del marco
	add	r7, sp, #0			@ actualiza el puntero del marco
	# Cuerpo de la funcion
    # Leer los datos ingresados por el usuario   
    ldr 	r0, =num1 
    movs 	r1, #0x6
    bl userInput
	
    ldr 	r0, =num2	
    movs 	r1, #0x6
    bl userInput

    ldr 	r0, =num3	
    movs 	r1, #0x6
    bl userInput
        
    ldr 	r0, =num4	
    movs 	r1, #0x6
    bl userInput

    ldr 	r0, =num5	
    movs 	r1, #0x6
    bl userInput
        
    # Llenar el arreglo 
	ldr 	r0, =num1
    bl asciiInt				@ convertir de ascci a entero
    mov 	r3, r0
	str		r3, [r7]

	ldr 	r0, =num2
    bl 	asciiInt			@ convertir de ascci a entero
    mov 	r3, r0
	str		r3, [r7, #4]
	
    ldr 	r0, =num3
    bl 	asciiInt			@ convertir de ascci a entero
    mov 	r3, r0
	str		r3, [r7, #8]
	
    ldr 	r0, =num4
    bl 	asciiInt			@ convertir de ascci a entero
    mov 	r3, r0
	str		r3, [r7, #12]

	ldr 	r0, =num5
    bl 	asciiInt			@ convertir de ascci a entero
    mov 	r3, r0
	str		r3, [r7, #16]
    
	mov		r3, r7
	mov		r0, r3

	bl	arrayAdd			@ salto a la funcion suma 
	str		r0, [r7, #20]	@ resguarda en memoria el resultado de la suma
    ldr 	r0, [r7, #20]	@ cargar el el resultado de la suma en r0
    
	bl 	intAscii			@ convertir de entero a ascci	
    ldr 	r0, =suma
    ldr 	r1, =#0x8
	bl 	userOutput			@ imprimir el resultado de la suma
    
	movs	r3, #0			@ return
	mov		r0, r3			@ restauracion del marco de main 
	adds	r7, r7, #24		@ regresa el valor original del stack pointer
	mov	sp, r7				@ regresa el valor orginal de r7
	pop	{r7, pc}			@ regresa el control al sistema
	.size	main, .-main
