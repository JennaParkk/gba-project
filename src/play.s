	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"play.c"
	.text
	.align	2
	.global	init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L5
	add	r2, r3, #40
.L2:
	str	r1, [r3, #4]!
	cmp	r3, r2
	bne	.L2
	ldr	r3, .L5+4
	ldr	r2, .L5+8
	ldr	r0, [r3]
	ldr	r1, [r2]
	ldr	r3, .L5+12
	ldr	r2, .L5+16
	stm	r3, {r0, r1, r2}
	bx	lr
.L6:
	.align	2
.L5:
	.word	intensity-4
	.word	gameTrack1_sampleRate
	.word	gameTrack1_length
	.word	songs
	.word	gameTrack1_data
	.size	init, .-init
	.align	2
	.global	playSong
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSong, %function
playSong:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	add	r0, r0, r0, lsl #1
	add	r0, r3, r0, lsl #2
	push	{r4, lr}
	ldr	r1, [r0, #4]
	mov	r2, #0
	ldr	r0, [r0, #8]
	ldr	r3, .L9+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	lr, #49152
	mvn	ip, #59
	mov	r0, #195
	mov	r1, #196
	ldr	r3, .L9+8
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	pop	{r4, lr}
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L10:
	.align	2
.L9:
	.word	songs
	.word	playSoundA
	.word	67109120
	.size	playSong, .-playSong
	.comm	intensity,40,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,12,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
