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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFire.part.0, %function
updateFire.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L12
	ldr	r3, [r4, #28]
	ldr	r5, .L12+4
	cmp	r3, #2
	ldr	r0, [r4]
	ldr	r3, [r4, #8]
	add	r1, r5, #16
	ldm	r1, {r1, ip}
	subeq	r0, r0, r3
	addne	r0, r0, r3
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	sub	sp, sp, #16
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r6, .L12+8
	str	r0, [r4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [r5, #56]
	subne	r3, r3, #1
	strne	r3, [r5, #56]
	ldr	r3, [r4]
	strne	r2, [r4, #60]
	cmp	r3, #0
	blt	.L5
	ldr	r2, [r4, #16]
	rsb	r2, r2, #256
	cmp	r3, r2
	ble	.L1
.L5:
	mov	r3, #0
	str	r3, [r4, #60]
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	fire
	.word	player
	.word	collision
	.size	updateFire.part.0, .-updateFire.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateFire.part.0, %function
activateFire.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r1, .L18
	ldr	r3, .L18+4
	push	{r4, lr}
	ldr	ip, [r1, #20]
	ldr	lr, [r1, #28]
	str	r2, [r3, #60]
	ldr	r2, [r1, #4]
	cmp	lr, #2
	add	ip, ip, ip, lsr #31
	ldreq	r4, [r3, #16]
	add	r2, r2, ip, asr #1
	ldr	ip, [r3, #20]
	ldrne	r4, [r1, #16]
	ldr	r0, [r1]
	rsbeq	r4, r4, #0
	add	ip, ip, ip, lsr #31
	add	r1, r0, r4
	sub	r2, r2, ip, asr #1
	str	lr, [r3, #28]
	str	r1, [r3]
	str	r1, [r3, #48]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	monster
	.word	fire
	.size	activateFire.part.0, .-activateFire.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxes.part.0, %function
drawBoxes.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L26
	ldr	r0, .L26+4
	ldr	r1, [r2]
	ldr	r3, [r2, #8]
	ldr	r0, [r0]
	add	r3, r1, r3
	cmp	r3, r0
	bxlt	lr
	add	r3, r0, #240
	cmp	r1, r3
	bxgt	lr
	push	{r4, lr}
	ldr	lr, .L26+8
	ldr	ip, [r2, #4]
	ldr	r3, [r2, #12]
	ldr	lr, [lr]
	add	r3, ip, r3
	cmp	r3, lr
	blt	.L20
	add	r3, lr, #160
	cmp	ip, r3
	bgt	.L20
	mov	r4, #256
	sub	r1, r1, r0
	lsl	r3, r1, #23
	ldr	r0, .L26+12
	sub	ip, ip, lr
	lsr	r3, r3, #23
	str	r1, [r2, #16]
	orr	r3, r3, #16384
	and	r1, ip, #255
	str	ip, [r2, #20]
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r4, [r0, #4]	@ movhi
.L20:
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	box1
	.word	hOff
	.word	vOff
	.word	shadowOAM+320
	.size	drawBoxes.part.0, .-drawBoxes.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAxe.part.0, %function
drawAxe.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L36
	ldr	r0, .L36+4
	ldr	r1, [r2]
	ldr	r3, [r2, #8]
	ldr	r0, [r0]
	add	r3, r1, r3
	cmp	r3, r0
	ble	.L32
	add	r3, r0, #239
	cmp	r1, r3
	bgt	.L32
	str	lr, [sp, #-4]!
	ldr	lr, .L36+8
	ldr	ip, [r2, #4]
	ldr	r3, [r2, #12]
	ldr	lr, [lr]
	add	r3, ip, r3
	cmp	r3, lr
	ble	.L29
	add	r3, lr, #159
	cmp	ip, r3
	bgt	.L29
	ldr	r3, [r2, #44]
	sub	r1, r1, r0
	add	r3, r3, #224
	ldr	r0, .L36+12
	sub	ip, ip, lr
	lsl	r3, r3, #22
	lsl	lr, r1, #23
	str	r1, [r2, #28]
	lsr	lr, lr, #23
	lsr	r3, r3, #22
	and	r1, ip, #255
	str	ip, [r2, #32]
	strh	r3, [r0, #100]	@ movhi
	strh	lr, [r0, #98]	@ movhi
	strh	r1, [r0, #96]	@ movhi
	b	.L28
.L32:
	mov	r2, #512
	ldr	r3, .L36+12
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L29:
	mov	r2, #512
	ldr	r3, .L36+12
	strh	r2, [r3, #96]	@ movhi
.L28:
	ldr	lr, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	axe
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawAxe.part.0, .-drawAxe.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMonsterHealth.part.0, %function
drawMonsterHealth.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r1, #140
	ldr	r3, .L48
	push	{r4, r5, r6, r7, lr}
	ldr	lr, [r3, #56]
	ldr	r2, .L48+4
	ldr	r3, .L48+8
	cmp	lr, ip
	strh	ip, [r2, #152]	@ movhi
	strh	r1, [r2, #154]	@ movhi
	strh	r3, [r2, #156]	@ movhi
	rsb	r0, lr, #3
	ble	.L43
	mov	r3, r2
	ldr	r7, .L48+12
	ldr	r6, .L48+16
	add	r5, r2, lr, lsl #3
	rsb	r4, r2, #148
.L42:
	add	r1, r4, r3
	and	r1, r1, r7
	strh	ip, [r3, #160]	@ movhi
	strh	r6, [r3, #164]	@ movhi
	strh	r1, [r3, #162]	@ movhi
	add	r3, r3, #8
	cmp	r3, r5
	bne	.L42
.L43:
	cmp	r0, #0
	ble	.L38
	mov	r4, #0
	add	r1, lr, r0
	lsl	r1, r1, #19
	lsl	r3, lr, #19
	add	r1, r1, #9699328
	add	r3, r3, #9699328
	ldr	r6, .L48+12
	ldr	r5, .L48+20
	lsr	r1, r1, #16
	add	r2, r2, lr, lsl #3
	lsr	r3, r3, #16
.L44:
	add	ip, r3, #8
	and	r0, r3, r6
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r3, r1
	strh	r4, [r2, #168]	@ movhi
	strh	r5, [r2, #172]	@ movhi
	strh	r0, [r2, #170]	@ movhi
	add	r2, r2, #8
	bne	.L44
.L38:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	monster
	.word	shadowOAM
	.word	329
	.word	511
	.word	331
	.word	330
	.size	drawMonsterHealth.part.0, .-drawMonsterHealth.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #16
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #8
	mov	r6, #400
	mov	r5, #3
	mov	r4, #10
	mov	lr, #2
	mov	ip, #1
	mov	r0, #5
	ldr	r3, .L52
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	r1, .L52+4
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #40]
	str	r4, [r3, #24]
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #56]
	str	r2, [r3, #28]
	str	r2, [r1]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	energy
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initMonster
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMonster, %function
initMonster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r1, #0
	mov	lr, #16
	mov	r6, #18
	mov	ip, #3
	mov	r0, #2
	mov	r5, #15
	mov	r4, #1
	mov	r10, #210
	mov	r9, #8
	mov	r8, #194
	mov	r7, #24
	ldr	r3, .L56
	str	r2, [r3, #64]
	ldr	r2, .L56+4
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r10, [r3]
	str	r6, [r3, #4]
	str	lr, [r2, #16]
	str	r9, [r2, #20]
	str	r8, [r2]
	str	r7, [r2, #4]
	str	r6, [r3, #60]
	str	ip, [r3, #40]
	str	ip, [r3, #56]
	str	ip, [r2, #40]
	str	r0, [r3, #28]
	str	r0, [r2, #28]
	str	r0, [r2, #8]
	str	r5, [r3, #24]
	str	r5, [r2, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #68]
	str	r1, [r2, #36]
	str	r1, [r2, #12]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	monster
	.word	fire
	.size	initMonster, .-initMonster
	.align	2
	.global	updateFire
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFire, %function
updateFire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L60
	ldr	r3, [r3, #60]
	cmp	r3, #0
	bxeq	lr
	b	updateFire.part.0
.L61:
	.align	2
.L60:
	.word	fire
	.size	updateFire, .-updateFire
	.align	2
	.global	activateFire
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateFire, %function
activateFire:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L64
	ldr	r3, [r3, #60]
	cmp	r3, #0
	bxne	lr
	b	activateFire.part.0
.L65:
	.align	2
.L64:
	.word	fire
	.size	activateFire, .-activateFire
	.align	2
	.global	drawCastle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCastle, %function
drawCastle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L68
	ldr	r3, [r3]
	add	r2, r3, #25
	cmp	r2, #272
	bxhi	lr
	ldr	r2, .L68+4
	ldr	r2, [r2]
	add	r1, r2, #152
	cmp	r1, #192
	bxhi	lr
	rsb	r3, r3, #215
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #292
	mvn	r3, r3, lsr #17
	ldr	r1, .L68+8
	rsb	r2, r2, #8
	and	r2, r2, #255
	strh	r3, [r1, #122]	@ movhi
	strh	r2, [r1, #120]	@ movhi
	strh	r0, [r1, #124]	@ movhi
	bx	lr
.L69:
	.align	2
.L68:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawCastle, .-drawCastle
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L77
	ldr	r3, [r0]
	cmp	r3, #239
	ble	.L73
	cmp	r3, #240
	ldreq	r3, [r0, #48]
	beq	.L72
.L73:
	ldr	r2, .L77+4
	ldr	r2, [r2]
	sub	r3, r3, r2
	str	r3, [r0, #48]
.L72:
	ldr	r2, [r0, #4]
	cmp	r2, #159
	ble	.L76
	cmp	r2, #160
	ldreq	r2, [r0, #52]
	beq	.L75
.L76:
	ldr	r1, .L77+8
	ldr	r1, [r1]
	sub	r2, r2, r1
	str	r2, [r0, #52]
.L75:
	ldr	r1, .L77+12
	ldr	ip, [r0, #36]
	ldr	r0, [r0, #28]
	ldr	r1, [r1]
	add	r0, r0, ip, lsl #5
	add	r1, r1, r0, lsl #1
	lsl	r3, r3, #23
	ldr	r0, .L77+16
	lsr	r3, r3, #23
	lsl	r1, r1, #22
	orr	r3, r3, #16384
	and	r2, r2, #255
	lsr	r1, r1, #22
	strh	r3, [r0, #106]	@ movhi
	strh	r2, [r0, #104]	@ movhi
	strh	r1, [r0, #108]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	player
	.word	hOff
	.word	vOff
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	drawMonster
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMonster, %function
drawMonster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L94
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L81
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L82
	ldr	r0, [r4, #36]
	ldr	r3, .L94+4
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #36]
	str	r3, [r4, #24]
.L82:
	ldr	r1, .L94+8
	ldr	r2, [r4]
	ldr	r3, [r4, #16]
	ldr	r1, [r1]
	add	r3, r2, r3
	cmp	r3, r1
	bge	.L93
.L81:
	ldr	r4, .L94+12
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L88
	ldr	r0, [r4, #36]
	ldr	r3, .L94+4
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #15
	str	r1, [r4, #36]
	str	r3, [r4, #24]
.L88:
	ldr	r1, .L94+8
	ldr	r2, [r4]
	ldr	r3, [r4, #16]
	ldr	r1, [r1]
	add	r3, r2, r3
	cmp	r3, r1
	blt	.L79
	add	r3, r1, #240
	cmp	r2, r3
	bgt	.L79
	ldr	ip, .L94+16
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	ip, [ip]
	add	r3, r0, r3
	cmp	r3, ip
	blt	.L79
	add	r3, ip, #160
	cmp	r0, r3
	bgt	.L79
	sub	r0, r0, ip
	sub	r2, r2, r1
	and	ip, r0, #255
	ldr	lr, [r4, #28]
	str	r0, [r4, #52]
	ldr	r0, [r4, #36]
	str	r2, [r4, #48]
	ldr	r1, .L94+20
	lsl	r2, r2, #23
	ldr	r3, .L94+24
	lsr	r2, r2, #23
	cmp	lr, #3
	add	r0, r0, #132
	orr	ip, ip, #16384
	orrne	r2, r2, #4096
	and	r1, r1, r0, lsl #1
	strh	ip, [r3, #136]	@ movhi
	strh	r2, [r3, #138]	@ movhi
	strh	r1, [r3, #140]	@ movhi
.L79:
	pop	{r4, lr}
	bx	lr
.L93:
	add	r3, r1, #240
	cmp	r2, r3
	bgt	.L81
	ldr	ip, .L94+16
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	ip, [ip]
	add	r3, r0, r3
	cmp	r3, ip
	blt	.L81
	add	r3, ip, #160
	cmp	r0, r3
	bgt	.L81
	sub	r0, r0, ip
	sub	r2, r2, r1
	and	ip, r0, #255
	ldr	lr, [r4, #28]
	str	r0, [r4, #52]
	ldr	r0, [r4, #36]
	lsl	r1, r2, #23
	str	r2, [r4, #48]
	ldr	r2, .L94+20
	ldr	r3, .L94+24
	lsr	r1, r1, #23
	cmp	lr, #3
	add	r0, r0, #100
	orreq	r1, r1, #16384
	orrne	r1, r1, #20480
	and	r2, r2, r0, lsl #1
	strh	ip, [r3, #112]	@ movhi
	strh	r1, [r3, #114]	@ movhi
	strh	r2, [r3, #116]	@ movhi
	b	.L81
.L95:
	.align	2
.L94:
	.word	monster
	.word	__aeabi_idivmod
	.word	hOff
	.word	fire
	.word	vOff
	.word	1022
	.word	shadowOAM
	.size	drawMonster, .-drawMonster
	.align	2
	.global	drawHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L107
	ldr	r2, [r3, #56]
	cmp	r2, #5
	push	{r4, r5, lr}
	ble	.L97
	mov	lr, #0
	mov	r2, #5
	mov	r0, #320
	ldr	r1, .L107+4
	str	r2, [r3, #56]
	strh	lr, [r1]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
.L98:
	mov	r0, #0
	mov	r5, r0
	ldr	r3, .L107+4
	ldr	r4, .L107+8
.L100:
	add	r0, r0, #1
	lsl	ip, r0, #3
	and	ip, ip, #504
	cmp	r0, r2
	strh	r5, [r3, #8]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	add	r3, r3, #8
	blt	.L100
.L99:
	cmp	lr, #0
	beq	.L96
	mov	r5, #0
	add	r3, r2, #1
	add	lr, r3, lr
	lsl	lr, lr, #19
	lsl	r3, r3, #19
	ldr	r4, .L107+12
	add	r2, r1, r2, lsl #3
	lsr	r3, r3, #16
	lsr	r1, lr, #16
.L102:
	add	ip, r3, #8
	and	r0, r3, #504
	lsl	r3, ip, #16
	lsr	r3, r3, #16
	cmp	r1, r3
	strh	r5, [r2, #8]	@ movhi
	strh	r4, [r2, #12]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	add	r2, r2, #8
	bne	.L102
.L96:
	pop	{r4, r5, lr}
	bx	lr
.L97:
	mov	r3, #0
	mov	r0, #320
	ldr	r1, .L107+4
	cmp	r2, r3
	strh	r3, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	rsb	lr, r2, #5
	bgt	.L98
	b	.L99
.L108:
	.align	2
.L107:
	.word	player
	.word	shadowOAM
	.word	322
	.word	321
	.size	drawHealth, .-drawHealth
	.align	2
	.global	collidesWithLadder
	.syntax unified
	.arm
	.fpu softvfp
	.type	collidesWithLadder, %function
collidesWithLadder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #32
	mov	r3, #224
	mov	r6, #16
	sub	sp, sp, #16
	ldr	r4, .L114
	str	r2, [sp, #12]
	ldr	ip, .L114+4
	str	r6, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp, #4]
	ldr	r5, .L114+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L110
.L112:
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L110:
	mov	r2, #47
	mov	r1, #24
	ldr	r3, .L114+12
	stm	sp, {r2, r3}
	str	r1, [sp, #12]
	str	r6, [sp, #8]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L112
	mov	r1, #73
	mov	r2, #151
	mov	r3, #232
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r6, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L112
	mov	r1, #117
	mov	r2, #40
	mov	r3, #8
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	str	r6, [sp, #8]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	player
	.word	423
	.word	collision
	.word	295
	.size	collidesWithLadder, .-collidesWithLadder
	.align	2
	.global	initBoxes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxes, %function
initBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #16
	mov	lr, #176
	mov	r2, #1
	mov	r0, #0
	ldr	r3, .L118
	ldr	ip, .L118+4
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L119:
	.align	2
.L118:
	.word	box1
	.word	439
	.size	initBoxes, .-initBoxes
	.align	2
	.global	updateBoxes
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBoxes, %function
updateBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	bxne	lr
	ldr	r3, .L122
	ldr	r2, [r3, #24]
	cmp	r2, #1
	moveq	r2, #0
	streq	r2, [r3, #24]
	bx	lr
.L123:
	.align	2
.L122:
	.word	box1
	.size	updateBoxes, .-updateBoxes
	.align	2
	.global	drawBoxes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxes, %function
drawBoxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L126
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	drawBoxes.part.0
.L125:
	mov	r2, #512
	ldr	r3, .L126+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L127:
	.align	2
.L126:
	.word	box1
	.word	shadowOAM+320
	.size	drawBoxes, .-drawBoxes
	.align	2
	.global	collidesWithBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	collidesWithBox, %function
collidesWithBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L135
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	sub	sp, sp, #20
	ldr	r4, .L135+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r5, .L135+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r0, #1
	beq	.L134
.L128:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L134:
	ldr	r3, .L135+12
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r0, #2
	bne	.L128
	ldr	r3, .L135+16
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r0, #3
	mvneq	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L136:
	.align	2
.L135:
	.word	box1
	.word	player
	.word	collision
	.word	box2
	.word	box3
	.size	collidesWithBox, .-collidesWithBox
	.align	2
	.global	drawEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnergy, %function
drawEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L151
	ldr	r0, [r3]
	cmp	r0, #5
	push	{r4, r5, r6, lr}
	ble	.L138
	mov	r0, #5
	mov	lr, #8
	mov	ip, #0
	mov	r2, #352
	ldr	r1, .L151+4
	str	r0, [r3]
	strh	lr, [r1, #48]	@ movhi
	strh	ip, [r1, #50]	@ movhi
	strh	r2, [r1, #52]	@ movhi
.L139:
	mov	lr, #8
	ldr	r3, .L151+4
	ldr	ip, .L151+8
	add	r0, r1, r0, lsl #3
	sub	r1, lr, r1
.L142:
	add	r2, r1, r3
	and	r2, r2, #504
	strh	lr, [r3, #56]	@ movhi
	strh	ip, [r3, #60]	@ movhi
	strh	r2, [r3, #58]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	bne	.L142
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	mov	r5, #8
	mov	r2, #0
	mov	r3, #352
	ldr	r1, .L151+4
	rsbs	r4, r0, #5
	strh	r5, [r1, #48]	@ movhi
	strh	r2, [r1, #50]	@ movhi
	strh	r3, [r1, #52]	@ movhi
	beq	.L140
	add	r3, r0, #1
	add	r4, r3, r4
	lsl	r4, r4, #19
	lsl	r3, r3, #19
	ldr	r6, .L151+12
	lsr	r4, r4, #16
	lsr	r3, r3, #16
	add	r2, r1, r0, lsl #3
.L141:
	add	lr, r3, #8
	and	ip, r3, #504
	lsl	r3, lr, #16
	lsr	r3, r3, #16
	cmp	r3, r4
	strh	r5, [r2, #56]	@ movhi
	strh	r6, [r2, #60]	@ movhi
	strh	ip, [r2, #58]	@ movhi
	add	r2, r2, #8
	bne	.L141
.L140:
	cmp	r0, #0
	bgt	.L139
	pop	{r4, r5, r6, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	energy
	.word	shadowOAM
	.word	354
	.word	353
	.size	drawEnergy, .-drawEnergy
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #344
	push	{r4, r5, r6, r7, lr}
	mov	r0, #8
	mov	r1, #1
	mov	ip, #0
	mov	r5, #2
	mov	r4, #3
	mov	lr, #15
	mov	r7, #96
	mov	r6, #144
	ldr	r2, .L155
	str	r3, [r2, #4]
	ldr	r3, .L155+4
	str	r5, [r2, #20]
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #20]
	str	r4, [r2, #44]
	str	r4, [r3, #44]
	str	lr, [r2, #24]
	str	lr, [r3, #24]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	str	ip, [r2]
	str	ip, [r2, #28]
	str	ip, [r3, #28]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r2, #16]
	str	r1, [r2, #40]
	str	r1, [r3, #16]
	str	r1, [r3, #40]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	enemy1
	.word	enemy2
	.size	initEnemies, .-initEnemies
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L169
	ldr	r2, [r3, #40]
	cmp	r2, #1
	beq	.L166
.L158:
	ldr	r3, .L169+4
	ldr	r2, [r3, #40]
	cmp	r2, #1
	bxne	lr
	ldr	r2, [r3, #44]
	cmp	r2, #3
	ldr	r2, [r3]
	beq	.L167
	cmp	r2, #95
	movle	r2, #3
	ldrgt	r1, [r3, #16]
	subgt	r2, r2, r1
	strgt	r2, [r3]
	strle	r2, [r3, #44]
	bx	lr
.L166:
	ldr	r2, [r3, #44]
	cmp	r2, #3
	ldr	r2, [r3]
	beq	.L168
	cmp	r2, #0
	movlt	r2, #3
	ldrge	r1, [r3, #16]
	subge	r2, r2, r1
	strge	r2, [r3]
	strlt	r2, [r3, #44]
	b	.L158
.L167:
	ldr	r1, [r3, #8]
	add	r1, r2, r1
	cmp	r1, #168
	movgt	r2, #2
	ldrle	r1, [r3, #16]
	addle	r2, r1, r2
	strle	r2, [r3]
	strgt	r2, [r3, #44]
	bx	lr
.L168:
	cmp	r2, #70
	movgt	r2, #2
	ldrle	r1, [r3, #16]
	addle	r2, r1, r2
	strle	r2, [r3]
	strgt	r2, [r3, #44]
	b	.L158
.L170:
	.align	2
.L169:
	.word	enemy1
	.word	enemy2
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L184
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L172
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L173
	ldr	r0, [r4, #28]
	ldr	r3, .L184+4
	ldr	r1, [r4, #20]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #28]
	str	r3, [r4, #24]
.L173:
	ldr	r1, .L184+8
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	ldr	r1, [r1]
	add	r3, r2, r3
	cmp	r3, r1
	bge	.L183
.L174:
	ldr	r4, .L184+12
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L177
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	bne	.L178
	ldr	r0, [r4, #28]
	ldr	r3, .L184+4
	ldr	r1, [r4, #20]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #28]
	str	r3, [r4, #24]
.L178:
	ldr	r1, .L184+8
	ldr	r2, [r4]
	ldr	r3, [r4, #8]
	ldr	r1, [r1]
	add	r3, r2, r3
	cmp	r3, r1
	blt	.L171
	add	r3, r1, #240
	cmp	r2, r3
	bgt	.L171
	ldr	ip, .L184+16
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	ip, [ip]
	add	r3, r0, r3
	cmp	r3, ip
	blt	.L171
	add	r3, ip, #160
	cmp	r0, r3
	bgt	.L171
	ldr	r3, [r4, #44]
	sub	r0, r0, ip
	ldr	ip, .L184+20
	cmp	r3, #3
	and	r3, r0, #255
	strh	r3, [ip, #144]	@ movhi
	ldr	r3, [r4, #28]
	sub	r2, r2, r1
	str	r2, [r4, #32]
	add	r3, r3, #198
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	lsl	r3, r3, #22
	orrne	r2, r2, #4096
	lsr	r3, r3, #22
	str	r0, [r4, #36]
	strh	r3, [ip, #148]	@ movhi
	strh	r2, [ip, #146]	@ movhi
.L171:
	pop	{r4, lr}
	bx	lr
.L177:
	mov	r2, #512
	ldr	r3, .L184+20
	pop	{r4, lr}
	strh	r2, [r3, #144]	@ movhi
	bx	lr
.L172:
	mov	r2, #512
	ldr	r3, .L184+24
	strh	r2, [r3]	@ movhi
	b	.L174
.L183:
	add	r3, r1, #240
	cmp	r2, r3
	bgt	.L174
	ldr	ip, .L184+16
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #12]
	ldr	ip, [ip]
	add	r3, r0, r3
	cmp	r3, ip
	blt	.L174
	add	r3, ip, #160
	cmp	r0, r3
	bgt	.L174
	ldr	r3, [r4, #44]
	sub	r0, r0, ip
	ldr	ip, .L184+24
	cmp	r3, #3
	and	r3, r0, #255
	strh	r3, [ip]	@ movhi
	ldr	r3, [r4, #28]
	sub	r2, r2, r1
	str	r2, [r4, #32]
	add	r3, r3, #196
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	ldr	r1, .L184+28
	lsl	r3, r3, #22
	orrne	r2, r2, #4096
	lsr	r3, r3, #22
	str	r0, [r4, #36]
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [r1]	@ movhi
	b	.L174
.L185:
	.align	2
.L184:
	.word	enemy1
	.word	__aeabi_idivmod
	.word	hOff
	.word	enemy2
	.word	vOff
	.word	shadowOAM
	.word	shadowOAM+328
	.word	shadowOAM+332
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	initSpikes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpikes, %function
initSpikes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #14
	mov	r5, #23
	mov	fp, #104
	mov	r10, #424
	mov	r3, #16
	mov	r9, #136
	mov	r4, #472
	mov	r8, #152
	ldr	r1, .L188
	str	fp, [r1]
	str	r10, [r1, #4]
	str	r5, [r1, #8]
	str	ip, [r1, #12]
	ldr	r1, .L188+4
	str	r5, [r1, #8]
	ldr	r5, .L188+8
	str	r9, [r1]
	str	r3, [r1, #12]
	str	r5, [r1, #4]
	ldr	r1, .L188+12
	str	r3, [r1, #8]
	str	r3, [r1, #12]
	str	r8, [r1]
	str	r4, [r1, #4]
	ldr	r1, .L188+16
	str	r4, [r1, #4]
	mov	r4, #192
	str	r3, [r1, #8]
	str	r3, [r1, #12]
	str	r4, [r1]
	ldr	r1, .L188+20
	str	r3, [r1, #12]
	mov	r3, #196
	mov	r4, #24
	str	r3, [r1]
	add	r3, r3, #69
	stmib	r1, {r3, r4}
	mov	lr, #88
	mov	r1, #154
	ldr	r3, .L188+24
	stm	r3, {r1, lr}
	mov	r1, #148
	str	ip, [r3, #12]
	str	ip, [r3, #8]
	ldr	r3, .L188+28
	mov	r2, #8
	mov	r0, #12
	str	r1, [r3]
	add	r1, r1, #150
	str	r1, [r3, #4]
	mov	r4, #128
	mov	r1, #173
	mov	ip, #9
	str	r2, [r3, #12]
	str	r0, [r3, #8]
	ldr	r3, .L188+32
	str	r2, [r3, #12]
	stm	r3, {r1, r4, ip}
	mov	r3, #168
	mov	r7, #82
	mov	r6, #184
	ldr	r1, .L188+36
	stm	r1, {r3, lr}
	ldr	r3, .L188+40
	str	r0, [r1, #8]
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r2, [r1, #12]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L189:
	.align	2
.L188:
	.word	spike1
	.word	spike4
	.word	393
	.word	spike2
	.word	spike3
	.word	spike6
	.word	spike8
	.word	spike5
	.word	spike7
	.word	spike9
	.word	spike10
	.size	initSpikes, .-initSpikes
	.align	2
	.global	collidesWithSpike
	.syntax unified
	.arm
	.fpu softvfp
	.type	collidesWithSpike, %function
collidesWithSpike:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L195
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	sub	sp, sp, #20
	ldr	r4, .L195+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r5, .L195+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L191
.L193:
	mov	r0, #1
.L190:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L191:
	ldr	r3, .L195+12
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+16
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+20
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+24
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+28
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+32
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+36
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+40
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	ldr	r3, .L195+44
	ldr	r0, [r3, #12]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L193
	mvn	r0, #0
	b	.L190
.L196:
	.align	2
.L195:
	.word	spike1
	.word	player
	.word	collision
	.word	spike2
	.word	spike3
	.word	spike4
	.word	spike5
	.word	spike6
	.word	spike7
	.word	spike8
	.word	spike9
	.word	spike10
	.size	collidesWithSpike, .-collidesWithSpike
	.align	2
	.global	initAxe
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAxe, %function
initAxe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r1, #8
	mov	lr, #3
	mov	ip, #1
	mov	r0, #4
	ldr	r3, .L199
	str	lr, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #44]
	str	r2, [r3, #60]
	str	r2, [r3, #64]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #40]
	ldr	lr, [sp], #4
	bx	lr
.L200:
	.align	2
.L199:
	.word	axe
	.size	initAxe, .-initAxe
	.align	2
	.global	updateAxe
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAxe, %function
updateAxe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L227
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldm	r4, {r5, r6}
	beq	.L202
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L202
	ldr	r3, [r4, #48]
	cmp	r3, #2
	ldr	r3, [r4, #16]
	subeq	r5, r5, r3
	addne	r5, r5, r3
	ldr	r3, [r4, #64]
	cmp	r3, #0
	str	r5, [r4]
	ldr	r1, [r4, #20]
	beq	.L226
.L205:
	add	r6, r6, r1
	str	r6, [r4, #4]
.L207:
	ldr	r2, [r4, #12]
	add	r3, r2, r6
	add	r3, r3, r1
	ldr	r1, .L227+4
	add	r3, r5, r3, lsl #8
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L208
	ldr	r0, [r4, #8]
	add	r3, r3, r0
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L209
.L208:
	mov	r3, #0
	str	r3, [r4, #24]
.L209:
	ldr	r3, .L227+8
	ldr	r3, [r3]
	cmp	r3, r5
	bgt	.L210
	add	r3, r3, #240
	cmp	r3, r5
	bge	.L211
.L210:
	mov	r3, #0
	str	r3, [r4, #24]
.L211:
	cmp	r5, #0
	blt	.L212
	ldr	r3, [r4, #8]
	rsb	r3, r3, #256
	cmp	r3, r5
	bge	.L213
.L212:
	mov	r3, #0
	str	r3, [r4, #24]
.L213:
	rsb	r2, r2, #512
	cmp	r2, r6
	movlt	r3, #0
	strlt	r3, [r4, #24]
	ldr	r3, [r4, #40]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #40]
	bne	.L202
	ldr	r0, [r4, #44]
	ldr	r3, .L227+12
	ldr	r1, [r4, #36]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #8
	str	r1, [r4, #44]
	str	r3, [r4, #40]
.L202:
	str	r5, [r4, #28]
	str	r6, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L226:
	ldr	r3, [r4, #52]
	sub	r3, r3, #14
	cmp	r3, r6
	movgt	r3, #1
	suble	r6, r6, r1
	strle	r6, [r4, #4]
	strgt	r3, [r4, #64]
	bgt	.L205
	b	.L207
.L228:
	.align	2
.L227:
	.word	axe
	.word	collisionmap2Bitmap
	.word	hOff
	.word	__aeabi_idivmod
	.size	updateAxe, .-updateAxe
	.align	2
	.global	drawAxe
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAxe, %function
drawAxe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L231
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	drawAxe.part.0
.L230:
	mov	r2, #512
	ldr	r3, .L231+4
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L232:
	.align	2
.L231:
	.word	axe
	.word	shadowOAM
	.size	drawAxe, .-drawAxe
	.align	2
	.global	checkMonster
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkMonster, %function
checkMonster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L237
	add	r1, r3, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	sub	sp, sp, #16
	ldr	r0, .L237+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L237+8
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r0, #1
	mvneq	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L238:
	.align	2
.L237:
	.word	axe
	.word	monster
	.word	collision
	.size	checkMonster, .-checkMonster
	.align	2
	.global	updateMonster
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMonster, %function
updateMonster:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, r6, lr}
	ldr	r4, .L257
	ldr	r3, [r4, #68]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #68]
	ldr	r3, .L257+4
	str	r2, [r4, #32]
	ldr	r2, [r3, #4]
	cmp	r2, #40
	ldr	r2, [r4]
	ble	.L252
	ldr	r5, .L257+8
.L241:
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #60]
	cmp	r1, r3
	mvnge	r3, #0
	movlt	r3, #1
	ldr	r0, [r4, #12]
	mla	r3, r0, r3, r1
	ldr	r1, [r4, #68]
	cmp	r1, #0
	str	r2, [r4, #48]
	str	r3, [r4, #4]
	str	r3, [r4, #52]
	beq	.L255
.L247:
	ldr	r3, [r5, #60]
	cmp	r3, #0
	beq	.L239
	pop	{r4, r5, r6, lr}
	b	updateFire.part.0
.L252:
	ldr	r3, [r3]
	cmp	r3, r2
	bgt	.L256
	cmp	r3, #80
	movlt	r3, #80
	cmp	r2, r3
	movgt	r1, #2
	ldrgt	r3, [r4, #8]
	subgt	r2, r2, r3
	strgt	r2, [r4]
	strgt	r1, [r4, #28]
.L243:
	ldr	r5, .L257+8
	ldr	r3, [r5, #60]
	cmp	r3, #0
	bleq	activateFire.part.0
.L254:
	ldr	r2, [r4]
	b	.L241
.L256:
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	cmp	r3, #200
	bgt	.L243
	mov	r1, #3
	ldr	r3, [r4, #8]
	add	r2, r3, r2
	str	r2, [r4]
	str	r1, [r4, #28]
	b	.L243
.L239:
	pop	{r4, r5, r6, lr}
	bx	lr
.L255:
	bl	checkMonster
	cmp	r0, #1
	ldreq	r3, [r4, #56]
	ldreq	r2, [r4, #64]
	subeq	r3, r3, #1
	streq	r3, [r4, #56]
	streq	r2, [r4, #68]
	b	.L247
.L258:
	.align	2
.L257:
	.word	monster
	.word	player
	.word	fire
	.size	updateMonster, .-updateMonster
	.align	2
	.global	initPower
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPower, %function
initPower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #3
	mov	r3, #8
	mov	r0, #1
	mov	r1, #15
	mov	r9, #80
	mov	r8, #184
	mov	r7, #160
	mov	r6, #112
	mov	r5, #114
	mov	r4, #144
	mov	lr, #232
	mov	ip, #296
	ldr	r2, .L261
	str	r10, [r2]
	add	r10, r10, #340
	str	r3, [r2, #8]
	str	r10, [r2, #4]
	str	r3, [r2, #12]
	str	r0, [r2, #24]
	str	r1, [r2, #32]
	ldr	r2, .L261+4
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #24]
	str	r1, [r2, #32]
	str	r9, [r2]
	str	r8, [r2, #4]
	ldr	r2, .L261+8
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #24]
	str	r1, [r2, #32]
	str	r7, [r2]
	str	r6, [r2, #4]
	ldr	r2, .L261+12
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r0, [r2, #24]
	str	r1, [r2, #32]
	str	r5, [r2]
	str	r4, [r2, #4]
	ldr	r2, .L261+16
	str	r0, [r2, #24]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r1, [r2, #32]
	str	lr, [r2]
	str	ip, [r2, #4]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L262:
	.align	2
.L261:
	.word	power1
	.word	power2
	.word	power3
	.word	power4
	.word	power5
	.size	initPower, .-initPower
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #4096
	ldr	r4, .L265
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L265+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L265+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L265+12
	ldr	r1, .L265+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L265+20
	ldr	r1, .L265+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L265+28
	ldr	r1, .L265+32
	mov	lr, pc
	bx	r4
	mov	r9, #4352
	mov	lr, #39936
	mov	r3, #67108864
	mov	r2, #5
	mov	r4, #0
	mov	r7, #16
	mov	ip, #400
	mov	r0, #10
	mov	r5, #8
	mov	r6, #1
	mov	r1, #2
	mov	r8, #3
	strh	r9, [r3]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	ldr	r3, .L265+36
	str	r2, [r3, #56]
	ldr	r2, .L265+40
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r7, [r3, #16]
	str	r7, [r3, #20]
	str	r1, [r3, #8]
	str	r5, [r3]
	str	r8, [r3, #40]
	str	r4, [r3, #28]
	str	r6, [r3, #12]
	str	r4, [r2]
	bl	initMonster
	mov	r1, #176
	ldr	r3, .L265+44
	ldr	r2, .L265+48
	str	r7, [r3, #8]
	stm	r3, {r1, r2}
	str	r7, [r3, #12]
	str	r6, [r3, #24]
	str	r4, [r3, #28]
	str	r6, [r3, #32]
	bl	initEnemies
	bl	initSpikes
	mov	r2, #4
	ldr	r3, .L265+52
	stmib	r3, {r4, r5}
	str	r8, [r3, #16]
	str	r4, [r3]
	str	r5, [r3, #12]
	str	r6, [r3, #20]
	str	r4, [r3, #24]
	str	r5, [r3, #40]
	str	r4, [r3, #44]
	str	r4, [r3, #60]
	str	r4, [r3, #64]
	str	r2, [r3, #36]
	bl	initPower
	ldr	r3, .L265+56
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L266:
	.align	2
.L265:
	.word	DMANow
	.word	forEvaTiles
	.word	forEvaPal
	.word	100720640
	.word	practiceFinalMap
	.word	100728832
	.word	spritesheet2Tiles
	.word	83886592
	.word	spritesheet2Pal
	.word	player
	.word	energy
	.word	box1
	.word	439
	.word	axe
	.word	cheat
	.size	initGame, .-initGame
	.align	2
	.global	updatePower
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePower, %function
updatePower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L309
	ldr	r3, [r4, #24]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L269
	ldr	r5, [r4, #32]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r4, #32]
	beq	.L304
.L269:
	ldr	r4, .L309+4
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L273
	ldr	r5, [r4, #32]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r4, #32]
	beq	.L305
.L273:
	ldr	r4, .L309+8
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L277
	ldr	r5, [r4, #32]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r4, #32]
	beq	.L306
.L277:
	ldr	r4, .L309+12
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L281
	ldr	r5, [r4, #32]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r4, #32]
	beq	.L307
.L281:
	ldr	r4, .L309+16
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L267
	ldr	r5, [r4, #32]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r4, #32]
	beq	.L308
.L267:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L308:
	ldr	r0, .L309+20
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L309+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L309+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r3, #15
	strne	r5, [r4, #24]
	str	r3, [r4, #32]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L304:
	ldr	r0, .L309+20
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L309+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L309+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r3, #15
	strne	r5, [r4, #24]
	str	r3, [r4, #32]
	b	.L269
.L305:
	ldr	r0, .L309+20
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L309+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L309+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r3, #15
	strne	r5, [r4, #24]
	str	r3, [r4, #32]
	b	.L273
.L306:
	ldr	r0, .L309+20
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L309+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L309+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r3, #15
	strne	r5, [r4, #24]
	str	r3, [r4, #32]
	b	.L277
.L307:
	ldr	r0, .L309+20
	ldr	r6, [r4, #12]
	ldr	ip, [r4, #8]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	lr, [r4, #4]
	ldm	r0, {r0, r1}
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	ldr	r6, .L309+24
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, .L309+28
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	mov	r3, #15
	strne	r5, [r4, #24]
	str	r3, [r4, #32]
	b	.L281
.L310:
	.align	2
.L309:
	.word	power1
	.word	power2
	.word	power3
	.word	power4
	.word	power5
	.word	player
	.word	collision
	.word	energy
	.size	updatePower, .-updatePower
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L431
	sub	sp, sp, #20
	ldr	r6, [r4]
	ldr	r5, [r4, #16]
	ldr	r7, [r4, #4]
	ldr	r8, [r4, #20]
	str	r3, [r4, #32]
	bl	collidesWithLadder
	add	r5, r6, r5
	add	r8, r7, r8
	cmp	r0, #0
	ldr	r1, [r4, #4]
	sub	r5, r5, #1
	sub	r2, r8, #1
	bne	.L313
	ldr	r3, [r4, #20]
	add	r3, r1, r3
	cmp	r3, #512
	blt	.L420
.L313:
	ldr	r3, .L431+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L318
	mov	lr, #3
	mov	ip, #1
	ldr	r3, [r4, #16]
	ldr	r0, [r4]
	rsb	r3, r3, #256
	cmp	r0, r3
	str	lr, [r4, #28]
	str	ip, [r4, #32]
	blt	.L421
.L318:
	ldr	r3, .L431+4
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L321
	mov	ip, #2
	mov	r0, #1
	ldr	r3, [r4]
	cmp	r3, #0
	str	ip, [r4, #28]
	str	r0, [r4, #32]
	blt	.L321
	ldr	lr, [r4, #8]
	ldr	ip, .L431+8
	sub	r0, r6, lr
	add	r8, r0, r7, lsl #8
	ldrb	r8, [r8, ip]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L422
.L321:
	ldr	r3, .L431+4
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L323
	mov	ip, #1
	ldr	r0, [r4, #20]
	add	r0, r1, r0
	cmp	r0, #512
	str	r3, [r4, #28]
	str	ip, [r4, #32]
	blt	.L423
.L323:
	ldr	r3, .L431+4
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L325
	mov	r3, #1
	cmp	r1, #0
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	blt	.L325
	ldr	r3, [r4, #12]
	ldr	r2, .L431+8
	sub	r3, r7, r3
	add	r0, r6, r3, lsl #8
	ldrb	r0, [r0, r2]	@ zero_extendqisi2
	cmp	r0, #0
	lsl	r3, r3, #8
	bne	.L424
.L325:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	rsb	r3, r3, #160
	ldr	r9, .L431+12
	add	r3, r3, r3, lsr #31
	sub	r3, r1, r3, asr #1
	str	r3, [r9]
	ldr	r3, .L431+4
	ldr	r0, [r4]
	ldrh	r3, [r3, #48]
	rsb	r2, r2, #240
	ldr	r8, .L431+16
	add	r2, r2, r2, lsr #31
	sub	r2, r0, r2, asr #1
	tst	r3, #2
	str	r2, [r8]
	beq	.L425
.L328:
	ldr	r5, .L431+20
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L331
	ldr	r3, .L431+24
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L426
.L332:
	bl	collidesWithBox
	cmp	r0, #1
	beq	.L427
.L337:
	bl	updatePower
	ldr	r3, .L431+28
	ldr	r3, [r3]
	cmp	r3, #5
	ldreq	r3, [r4, #56]
	addeq	r3, r3, #1
	streq	r3, [r4, #56]
	ldr	r3, .L431+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L340
	ldr	r3, .L431+4
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L428
.L340:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L343
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	beq	.L429
.L344:
	ldr	r3, [r9]
	cmp	r3, #352
	movge	r3, #352
	strge	r3, [r9]
	bge	.L347
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r9]
.L347:
	ldr	r3, [r8]
	cmp	r3, #15
	movgt	r3, #16
	strgt	r3, [r8]
	bgt	.L311
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r8]
.L311:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L426:
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r7, .L431+36
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r4, #56]
	subne	r3, r3, #1
	strne	r6, [r5, #40]
	strne	r3, [r4, #56]
.L331:
	ldr	r5, .L431+40
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L332
	ldr	r3, .L431+24
	ldr	r6, [r3]
	cmp	r6, #0
	bne	.L332
	ldr	r0, [r5, #12]
	ldr	r1, [r5, #8]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r7, .L431+36
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r4, #56]
	subne	r3, r3, #1
	strne	r6, [r5, #40]
	strne	r3, [r4, #56]
	bl	collidesWithBox
	cmp	r0, #1
	bne	.L337
.L427:
	ldr	r2, .L431+44
	ldr	r3, [r2, #24]
	cmp	r3, #0
	beq	.L337
	cmp	r3, #1
	ldr	r3, .L431+48
	mov	ip, #8
	str	r0, [r3, #60]
	moveq	r3, #0
	ldr	r1, .L431+52
	streq	r3, [r2, #24]
	str	ip, [r1]
	b	.L337
.L343:
	mov	r2, #10
	str	r3, [r4, #36]
	str	r2, [r4, #24]
	b	.L344
.L423:
	ldr	r0, [r4, #12]
	ldr	r3, .L431+8
	add	r2, r2, r0
	add	r0, r6, r2, lsl #8
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	cmp	r0, #0
	lsl	r2, r2, #8
	beq	.L323
	add	r2, r5, r2
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L323
	bl	collidesWithLadder
	cmp	r0, #0
	ldr	r1, [r4, #4]
	ldrne	r3, [r4, #12]
	addne	r1, r1, r3
	strne	r1, [r4, #4]
	b	.L323
.L421:
	ldr	r3, [r4, #8]
	ldr	lr, .L431+8
	add	ip, r3, r5
	add	r8, ip, r7, lsl #8
	ldrb	r8, [r8, lr]	@ zero_extendqisi2
	cmp	r8, #0
	beq	.L318
	add	ip, ip, r2, lsl #8
	ldrb	ip, [ip, lr]	@ zero_extendqisi2
	cmp	ip, #0
	addne	r3, r0, r3
	strne	r3, [r4]
	b	.L318
.L420:
	add	r8, r8, #3
	ldr	r3, .L431+8
	add	r0, r6, r8, lsl #8
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	cmp	r0, #0
	lsl	r8, r8, #8
	bne	.L430
.L314:
	sub	r0, r8, #256
	add	ip, r6, r0
	ldrb	ip, [r3, ip]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L315
	add	r0, r5, r0
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	cmp	r0, #0
	addne	r1, r1, #3
	strne	r1, [r4, #4]
	bne	.L313
.L315:
	sub	r0, r8, #512
	add	ip, r6, r0
	ldrb	ip, [r3, ip]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L316
	add	r0, r5, r0
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	cmp	r0, #0
	addne	r1, r1, #2
	strne	r1, [r4, #4]
	bne	.L313
.L316:
	sub	r8, r8, #768
	add	r0, r6, r8
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L313
	add	r8, r5, r8
	ldrb	r3, [r3, r8]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r1, r1, #1
	strne	r1, [r4, #4]
	b	.L313
.L428:
	ldr	r3, .L431+48
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L340
	ldr	r1, [r3, #60]
	cmp	r1, #0
	beq	.L340
	ldr	r1, [r4, #28]
	mov	r0, #1
	cmp	r1, #2
	movne	r1, #3
	str	r2, [r3, #64]
	str	r0, [r3, #24]
	ldr	r2, [r4]
	ldrne	r0, [r4, #16]
	streq	r1, [r3, #48]
	strne	r1, [r3, #48]
	ldr	r1, [r4, #4]
	addne	r2, r2, r0
	streq	r2, [r3]
	strne	r2, [r3]
	str	r2, [r3, #56]
	str	r1, [r3, #4]
	str	r1, [r3, #52]
	b	.L340
.L425:
	bl	collidesWithLadder
	cmp	r0, #0
	bne	.L328
	ldr	r3, [r4, #4]
	cmp	r3, #0
	blt	.L328
	ldr	r2, [r4, #12]
	sub	r7, r7, r2
	ldr	r2, .L431+8
	add	r6, r6, r7, lsl #8
	ldrb	r1, [r6, r2]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	r7, r7, #8
	beq	.L328
	add	r7, r5, r7
	ldrb	r2, [r7, r2]	@ zero_extendqisi2
	cmp	r2, #0
	subne	r3, r3, #7
	strne	r3, [r4, #4]
	b	.L328
.L429:
	bl	collidesWithSpike
	cmp	r0, #1
	bne	.L345
	ldr	r3, .L431+24
	ldr	r3, [r3]
	cmp	r3, #0
	ldreq	r3, [r4, #56]
	subeq	r3, r3, #1
	streq	r3, [r4, #56]
.L345:
	ldr	r0, [r4, #36]
	ldr	r3, .L431+56
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #10
	str	r1, [r4, #36]
	str	r3, [r4, #24]
	b	.L344
.L422:
	add	r0, r0, r2, lsl #8
	ldrb	r0, [r0, ip]	@ zero_extendqisi2
	cmp	r0, #0
	subne	r3, r3, lr
	strne	r3, [r4]
	b	.L321
.L424:
	add	r3, r5, r3
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L325
	bl	collidesWithLadder
	cmp	r0, #0
	ldr	r1, [r4, #4]
	ldrne	r3, [r4, #12]
	subne	r1, r1, r3
	strne	r1, [r4, #4]
	b	.L325
.L430:
	add	r0, r5, r8
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	cmp	r0, #0
	addne	r1, r1, #4
	strne	r1, [r4, #4]
	bne	.L313
	b	.L314
.L432:
	.align	2
.L431:
	.word	player
	.word	67109120
	.word	collisionmap2Bitmap
	.word	vOff
	.word	hOff
	.word	enemy1
	.word	cheat
	.word	energy
	.word	oldButtons
	.word	collision
	.word	enemy2
	.word	box1
	.word	axe
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateMonster
	bl	updateEnemies
	pop	{r4, lr}
	b	updateAxe
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPower
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPower, %function
drawPower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L451
	ldr	r2, [r3, #24]
	cmp	r2, #0
	push	{r4, lr}
	beq	.L436
	ldr	r0, .L451+4
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r0]
	add	r2, r1, r2
	cmp	r2, r0
	bge	.L447
.L437:
	ldr	r3, .L451+8
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L438
	ldr	r0, .L451+4
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r0]
	add	r2, r1, r2
	cmp	r2, r0
	bge	.L448
.L439:
	ldr	r3, .L451+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L440
	ldr	r0, .L451+4
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r0]
	add	r2, r1, r2
	cmp	r2, r0
	bge	.L449
.L441:
	ldr	r3, .L451+16
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L442
	ldr	r0, .L451+4
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r0]
	add	r2, r1, r2
	cmp	r2, r0
	bge	.L450
.L443:
	ldr	r3, .L451+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L444
	ldr	r0, .L451+4
	ldr	r1, [r3]
	ldr	r2, [r3, #8]
	ldr	r0, [r0]
	add	r2, r1, r2
	cmp	r2, r0
	blt	.L435
	add	r2, r0, #240
	cmp	r1, r2
	bgt	.L435
	ldr	lr, .L451+24
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	lr, [lr]
	add	r2, ip, r2
	cmp	r2, lr
	blt	.L435
	add	r2, lr, #240
	cmp	ip, r2
	bgt	.L435
	mov	r4, #352
	sub	r1, r1, r0
	ldr	r2, .L451+28
	sub	ip, ip, lr
	lsl	r0, r1, #23
	str	r1, [r3, #16]
	lsr	r0, r0, #23
	and	r1, ip, #255
	str	ip, [r3, #20]
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
.L435:
	pop	{r4, lr}
	bx	lr
.L444:
	mov	r2, #512
	ldr	r3, .L451+28
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L442:
	mov	r2, #512
	ldr	r3, .L451+32
	strh	r2, [r3]	@ movhi
	b	.L443
.L440:
	mov	r2, #512
	ldr	r3, .L451+36
	strh	r2, [r3]	@ movhi
	b	.L441
.L438:
	mov	r2, #512
	ldr	r3, .L451+40
	strh	r2, [r3]	@ movhi
	b	.L439
.L436:
	mov	r2, #512
	ldr	r3, .L451+44
	strh	r2, [r3]	@ movhi
	b	.L437
.L450:
	add	r2, r0, #240
	cmp	r1, r2
	bgt	.L443
	ldr	lr, .L451+24
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	lr, [lr]
	add	r2, ip, r2
	cmp	r2, lr
	blt	.L443
	add	r2, lr, #240
	cmp	ip, r2
	bgt	.L443
	mov	r4, #352
	sub	r1, r1, r0
	ldr	r2, .L451+32
	sub	ip, ip, lr
	lsl	r0, r1, #23
	str	r1, [r3, #16]
	lsr	r0, r0, #23
	and	r1, ip, #255
	str	ip, [r3, #20]
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	b	.L443
.L449:
	add	r2, r0, #240
	cmp	r1, r2
	bgt	.L441
	ldr	lr, .L451+24
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	lr, [lr]
	add	r2, ip, r2
	cmp	r2, lr
	blt	.L441
	add	r2, lr, #240
	cmp	ip, r2
	bgt	.L441
	mov	r4, #352
	sub	r1, r1, r0
	ldr	r2, .L451+36
	sub	ip, ip, lr
	lsl	r0, r1, #23
	str	r1, [r3, #16]
	lsr	r0, r0, #23
	and	r1, ip, #255
	str	ip, [r3, #20]
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	b	.L441
.L448:
	add	r2, r0, #240
	cmp	r1, r2
	bgt	.L439
	ldr	lr, .L451+24
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	lr, [lr]
	add	r2, ip, r2
	cmp	r2, lr
	blt	.L439
	add	r2, lr, #240
	cmp	ip, r2
	bgt	.L439
	mov	r4, #352
	sub	r1, r1, r0
	ldr	r2, .L451+40
	sub	ip, ip, lr
	lsl	r0, r1, #23
	str	r1, [r3, #16]
	lsr	r0, r0, #23
	and	r1, ip, #255
	str	ip, [r3, #20]
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	b	.L439
.L447:
	add	r2, r0, #240
	cmp	r1, r2
	bgt	.L437
	ldr	lr, .L451+24
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	lr, [lr]
	add	r2, ip, r2
	cmp	r2, lr
	blt	.L437
	add	r2, lr, #240
	cmp	ip, r2
	bgt	.L437
	mov	r4, #352
	sub	r1, r1, r0
	ldr	r2, .L451+44
	sub	ip, ip, lr
	lsl	r0, r1, #23
	str	r1, [r3, #16]
	lsr	r0, r0, #23
	and	r1, ip, #255
	str	ip, [r3, #20]
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	b	.L437
.L452:
	.align	2
.L451:
	.word	power1
	.word	hOff
	.word	power2
	.word	power3
	.word	power4
	.word	power5
	.word	vOff
	.word	shadowOAM+336
	.word	shadowOAM+368
	.word	shadowOAM+360
	.word	shadowOAM+352
	.word	shadowOAM+344
	.size	drawPower, .-drawPower
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #4096
	ldr	r4, .L460
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L460+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L460+8
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L460+12
	ldr	r1, .L460+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L460+20
	ldr	r1, .L460+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L460+28
	ldr	r1, .L460+32
	mov	lr, pc
	bx	r4
	bl	drawCastle
	bl	drawPlayer
	bl	drawMonster
	bl	drawHealth
	ldr	r3, .L460+36
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L454
	bl	drawBoxes.part.0
.L455:
	bl	drawPower
	bl	drawEnergy
	ldr	r3, .L460+40
	ldr	r3, [r3, #4]
	cmp	r3, #40
	blle	drawMonsterHealth.part.0
.L456:
	bl	drawEnemies
	ldr	r3, .L460+44
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L457
	bl	drawAxe.part.0
.L458:
	mov	r2, #67108864
	ldr	r3, .L460+48
	ldrh	r1, [r3]
	ldr	r3, .L460+52
	strh	r1, [r2, #16]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L460+56
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L454:
	mov	r2, #512
	ldr	r3, .L460+60
	strh	r2, [r3]	@ movhi
	b	.L455
.L457:
	mov	r2, #512
	ldr	r3, .L460+56
	strh	r2, [r3, #96]	@ movhi
	b	.L458
.L461:
	.align	2
.L460:
	.word	DMANow
	.word	forEvaTiles
	.word	forEvaPal
	.word	100720640
	.word	practiceFinalMap
	.word	100728832
	.word	spritesheet2Tiles
	.word	83886592
	.word	spritesheet2Pal
	.word	box1
	.word	player
	.word	axe
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	shadowOAM+320
	.size	drawGame, .-drawGame
	.align	2
	.global	drawMonsterHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMonsterHealth, %function
drawMonsterHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L464
	ldr	r3, [r3, #4]
	cmp	r3, #40
	bxgt	lr
	b	drawMonsterHealth.part.0
.L465:
	.align	2
.L464:
	.word	player
	.size	drawMonsterHealth, .-drawMonsterHealth
	.align	2
	.global	turnOnCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	turnOnCheat, %function
turnOnCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #5
	mov	ip, #1
	ldr	r0, .L467
	ldr	r1, .L467+4
	ldr	r2, .L467+8
	str	ip, [r0]
	str	r3, [r1, #56]
	str	r3, [r2]
	bx	lr
.L468:
	.align	2
.L467:
	.word	cheat
	.word	player
	.word	energy
	.size	turnOnCheat, .-turnOnCheat
	.comm	cheat,4,4
	.comm	enemy3,48,4
	.comm	enemy2,48,4
	.comm	enemy1,48,4
	.comm	spike10,16,4
	.comm	spike9,16,4
	.comm	spike8,16,4
	.comm	spike7,16,4
	.comm	spike6,16,4
	.comm	spike5,16,4
	.comm	spike4,16,4
	.comm	spike3,16,4
	.comm	spike2,16,4
	.comm	spike1,16,4
	.comm	power5,36,4
	.comm	power4,36,4
	.comm	power3,36,4
	.comm	power2,36,4
	.comm	power1,36,4
	.comm	box3,36,4
	.comm	box2,36,4
	.comm	box1,36,4
	.comm	axe,68,4
	.comm	fire,68,4
	.global	playerSprite
	.comm	energy,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	monster,72,4
	.comm	player,72,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerSprite, %object
	.size	playerSprite, 4
playerSprite:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
