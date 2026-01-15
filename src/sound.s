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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L7+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L7+12
	ldr	r4, .L7+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L7+20
	ldr	r3, .L7+24
	strh	r7, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	ldr	r3, .L7+28
	str	r6, [r4]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+32
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+36
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L24
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L11
	ldr	r3, .L24+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L13
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L13
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L22
	ldr	r0, .L24+8
	ldr	r1, .L24+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L13:
	ldr	r3, .L24+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L11
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L11
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L23
	ldr	r0, .L24+8
	ldr	r1, .L24+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L11:
	mov	r1, #1
	ldr	r3, .L24
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L22:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L13
.L23:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L11
.L25:
	.align	2
.L24:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L28+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L28+12
	ldr	r4, .L28+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L28+20
	ldr	r3, .L28+24
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	ldr	r3, .L28+28
	str	r6, [r4]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L28+32
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L28+36
	ldr	r3, .L28+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L28+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L29:
	.align	3
.L28:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSoundA, %function
pauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L31
	ldr	r2, .L31+4
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	soundA
	.word	67109120
	.size	pauseSoundA, .-pauseSoundA
	.align	2
	.global	pauseSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSoundB, %function
pauseSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L34
	ldr	r2, .L34+4
	str	r3, [r1, #8]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L35:
	.align	2
.L34:
	.word	soundB
	.word	67109120
	.size	pauseSoundB, .-pauseSoundB
	.align	2
	.global	unpauseSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSoundA, %function
unpauseSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L37
	ldr	r3, .L37+4
	str	r0, [r1, #8]
	strh	r2, [r3, #2]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	soundA
	.word	67109120
	.size	unpauseSoundA, .-unpauseSoundA
	.align	2
	.global	unpauseSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSoundB, %function
unpauseSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L40
	ldr	r3, .L40+4
	str	r0, [r1, #8]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L41:
	.align	2
.L40:
	.word	soundB
	.word	67109120
	.size	unpauseSoundB, .-unpauseSoundB
	.align	2
	.global	stopSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSoundA, %function
stopSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L43
	ldr	r1, .L43+4
	strh	r3, [r2, #2]	@ movhi
	ldr	r1, [r1]
	ldr	r2, .L43+8
	str	r3, [r1, #20]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	bx	lr
.L44:
	.align	2
.L43:
	.word	67109120
	.word	dma
	.word	soundA
	.size	stopSoundA, .-stopSoundA
	.align	2
	.global	stopSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSoundB, %function
stopSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L46
	ldr	r1, .L46+4
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, [r1]
	ldr	r2, .L46+8
	str	r3, [r1, #32]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	bx	lr
.L47:
	.align	2
.L46:
	.word	67109120
	.word	dma
	.word	soundB
	.size	stopSoundB, .-stopSoundB
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L49
	ldr	r2, .L49+4
	ldr	r1, [r1]
	ldr	ip, .L49+8
	ldr	r0, .L49+12
	str	r3, [r1, #20]
	str	r3, [ip, #8]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #8]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L50:
	.align	2
.L49:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L53
	ldr	r2, .L53+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L53+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L54:
	.align	2
.L53:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundB,24,4
	.comm	soundA,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
