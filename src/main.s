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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #67108864
	mov	r5, #0
	mov	r3, #768
	mov	r1, #7936
	ldr	ip, .L4
	ldr	r4, .L4+4
	strh	r3, [r0]	@ movhi
	mov	r2, #83886080
	strh	r5, [r0, #16]	@ movhi
	mov	r3, #256
	strh	r1, [r0, #8]	@ movhi
	strh	ip, [r0, #10]	@ movhi
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	ldr	r1, .L4+48
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+52
	mov	lr, pc
	bx	r3
	ldr	r1, .L4+56
	ldr	r2, .L4+60
	ldr	r3, .L4+64
	str	r5, [r1]
	str	r5, [r2]
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	7684
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	bgStartPal
	.word	100679680
	.word	bgStartTiles
	.word	100724736
	.word	bgStartMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.word	seed
	.word	bgTimer
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L8
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #50
	ldr	r2, .L8+4
	ldr	r3, .L8+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	bgTimer
	.word	setupSounds
	.word	setupInterrupts
	.word	DMANow
	.word	shadowOAM
	.word	hideSprites
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	mov	ip, #7936
	mov	r3, #256
	mov	r1, #0
	push	{r4, lr}
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r4, .L12
	strh	r1, [r0, #18]	@ movhi
	strh	r1, [r0, #16]	@ movhi
	strh	ip, [r0, #8]	@ movhi
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+16
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instruction1Pal
	.word	4720
	.word	instruction1Tiles
	.word	100726784
	.word	instruction1Map
	.word	waitForVBlank
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r4, #67108864
	mov	r2, #4352
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	ldr	r2, .L16
	strh	r3, [r4, #16]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r5, .L16+4
	mov	r2, #117440512
	ldr	r1, .L16+8
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+12
	mov	lr, pc
	bx	r3
	mov	r1, #39936
	mov	r2, #2
	ldr	r3, .L16+16
	strh	r1, [r4, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L30
	ldr	r3, [r4]
	ldr	r2, .L30+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	mov	r0, #67108864
	ldr	r1, .L30+8
	ldr	r2, [r1]
	ldr	r3, .L30+12
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	sub	r3, r3, r2, asr #31
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	ldr	r5, .L30+16
	strh	r3, [r0, #20]	@ movhi
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L19
	ldr	r2, .L30+20
	ldrh	r2, [r2, #48]
	tst	r2, #2
	beq	.L28
.L19:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L30+20
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L29
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	ldr	r3, .L30+24
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+32
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L30+36
	ldr	r3, .L30+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToGame
.L28:
	ldr	r3, .L30+28
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	bl	goToInstruction
	ldrh	r3, [r5]
	b	.L19
.L31:
	.align	2
.L30:
	.word	seed
	.word	waitForVBlank
	.word	bgTimer
	.word	1431655766
	.word	oldButtons
	.word	67109120
	.word	initGame
	.word	srand
	.word	gameTrack1_length
	.word	gameTrack1_data
	.word	playSoundA
	.size	start, .-start
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L33
	ldr	r2, .L44+4
	ldrh	r2, [r2, #48]
	tst	r2, #1
	beq	.L42
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L44+4
	ldrh	r3, [r3, #48]
	tst	r3, #4
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L42:
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	67109120
	.word	initGame
	.size	instruction, .-instruction
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r5, #67108864
	mov	r2, #7936
	ldr	r4, .L48
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L48+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #3168
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L48+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L48+12
	mov	r3, #1024
	ldr	r2, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L48+20
	strh	r3, [r5, #18]	@ movhi
	strh	r3, [r5, #16]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L48+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L48+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	DMANow
	.word	bgPausePal
	.word	bgPauseTiles
	.word	bgPauseMap
	.word	100726784
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L62
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+8
	ldrh	r2, [r2, #48]
	tst	r2, #8
	beq	.L60
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L62+8
	ldrh	r3, [r3, #48]
	tst	r3, #4
	beq	.L61
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	pop	{r4, r5, r6, lr}
	b	goToStart
.L60:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L62+12
	ldr	r5, .L62+16
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldrh	r3, [r4]
	b	.L51
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	waitForVBlank
	.word	67109120
	.word	forEvaPal
	.word	DMANow
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #768
	mov	r5, #67108864
	mov	r2, #7936
	mov	r6, #0
	ldr	r1, .L66
	ldr	r4, .L66+4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #10]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L66+8
	mov	lr, pc
	bx	r4
	mov	r3, #1664
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+16
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+24
	mov	lr, pc
	bx	r4
	mov	r3, #992
	mov	r0, #3
	ldr	r2, .L66+28
	ldr	r1, .L66+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L66+36
	ldr	r1, .L66+40
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	strh	r6, [r5, #20]	@ movhi
	ldr	r3, .L66+44
	strh	r6, [r5, #22]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+48
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+52
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r0, .L66+56
	ldr	r1, .L66+60
	ldr	r3, .L66+64
	str	r6, [r0]
	str	r6, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	7684
	.word	DMANow
	.word	winScreenPal
	.word	winScreenTiles
	.word	100726784
	.word	winScreenMap
	.word	bgWinPal
	.word	100679680
	.word	bgWinTiles
	.word	100724736
	.word	bgWinMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	seed
	.word	bgTimer
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	ldr	r1, .L75
	ldr	r2, [r1]
	ldr	r3, .L75+4
	sub	r2, r2, #1
	smull	ip, r3, r2, r3
	sub	r3, r3, r2, asr #31
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	str	r2, [r1]
	strh	r3, [r0, #20]	@ movhi
	ldr	r2, .L75+8
	mov	lr, pc
	bx	r2
	ldr	r3, .L75+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L75+16
	ldrh	r3, [r3, #48]
	tst	r3, #8
	beq	.L74
.L68:
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	goToStart
.L76:
	.align	2
.L75:
	.word	bgTimer
	.word	1431655766
	.word	hideSprites
	.word	oldButtons
	.word	67109120
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r5, #67108864
	mov	r2, #7936
	mov	r6, #0
	ldr	r4, .L79
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L79+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #2528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L79+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L79+12
	ldr	r1, .L79+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	strh	r6, [r5, #16]	@ movhi
	ldr	r3, .L79+20
	strh	r6, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	ldr	r1, .L79+24
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r1, .L79+32
	ldr	r3, .L79+36
	str	r6, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100726784
	.word	loseScreenMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	seed
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L97
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L97+8
	ldr	r3, .L97+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L97+16
	mov	r3, #256
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L97+20
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L82
	ldr	r2, .L97+24
	ldrh	r2, [r2, #48]
	tst	r2, #8
	beq	.L93
.L82:
	tst	r3, #512
	beq	.L83
	ldr	r3, .L97+24
	ldrh	r3, [r3, #48]
	tst	r3, #512
	beq	.L94
.L83:
	ldr	r3, .L97+28
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L95
.L84:
	ldr	r3, .L97+32
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L96
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	bl	goToLose
	ldr	r3, .L97+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	bl	goToWin
	ldr	r3, .L97+36
	mov	lr, pc
	bx	r3
	b	.L84
.L94:
	ldr	r3, .L97+40
	mov	lr, pc
	bx	r3
	b	.L83
.L93:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L82
.L98:
	.align	2
.L97:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	67109120
	.word	monster
	.word	player
	.word	stopSounds
	.word	turnOnCheat
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L106
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L106+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L99
	ldr	r3, .L106+8
	ldrh	r3, [r3, #48]
	tst	r3, #8
	beq	.L105
.L99:
	pop	{r4, lr}
	bx	lr
.L105:
	pop	{r4, lr}
	b	goToStart
.L107:
	.align	2
.L106:
	.word	hideSprites
	.word	oldButtons
	.word	67109120
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L121
	mov	lr, pc
	bx	r3
	ldr	r10, .L121+4
	ldr	r4, .L121+8
	ldr	r9, .L121+12
	ldr	r8, .L121+16
	ldr	r7, .L121+20
	ldr	fp, .L121+24
	ldr	r6, .L121+28
	ldr	r5, .L121+32
.L110:
	ldrh	r3, [r4]
	strh	r3, [r10]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r9
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L110
.L112:
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L111
.L111:
	ldr	r3, .L121+36
	mov	lr, pc
	bx	r3
	b	.L110
.L113:
	ldr	r3, .L121+40
	mov	lr, pc
	bx	r3
	b	.L110
.L114:
	ldr	r3, .L121+44
	mov	lr, pc
	bx	r3
	b	.L110
.L115:
	ldr	r3, .L121+48
	mov	lr, pc
	bx	r3
	b	.L110
.L116:
	ldr	r3, .L121+52
	mov	lr, pc
	bx	r3
	b	.L110
.L117:
	mov	lr, pc
	bx	fp
	b	.L110
.L122:
	.align	2
.L121:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	state
	.word	start
	.word	67109120
	.word	shadowOAM
	.word	lose
	.word	win
	.word	pause
	.word	game
	.word	instruction
	.size	main, .-main
	.comm	state,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	bgTimer2,4,4
	.comm	bgTimer,4,4
	.comm	seed,4,4
	.comm	songs,24,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	monster,72,4
	.comm	player,72,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
