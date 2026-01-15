#include "gba.h"
#include "sound.h"

//Sets up the sound handlers
void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;
	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}



void playSoundA(const signed char* data, int dataLength, int looping) {
    
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND/SOUND_FREQ;

    // Set DMA channel to 1
    dma[1].cnt = 0;
    DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
    // Set up timer 0
    REG_TM0CNT = 0;
    REG_TM0D = -cyclesPerSample;
    REG_TM0CNT = TIMER_ON;

    // Initialize struct members of soundA
    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.looping = looping;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char* data, int dataLength, int looping) {

    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND/SOUND_FREQ;
    // Set DMA channel to 2
    dma[2].cnt = 0;
    DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 1
    REG_TM1CNT = 0;
    REG_TM1D = -cyclesPerSample;
    REG_TM1CNT = TIMER_ON;

    // Initialize struct members of soundB
    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.looping = looping;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundB.vBlankCount = 0;
}

//Pauses sound A and sound B, respectively
void pauseSoundA() {

	soundA.isPlaying = 0;
	REG_TM0CNT = 0;
}

void pauseSoundB() {

	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
}



//Unpauses sound A and sound B, respectively
void unpauseSoundA() {

	soundA.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
}

void unpauseSoundB() {

	soundB.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;
}



//Stops sound A and sound B, respectively
void stopSoundA() {

	soundA.isPlaying = 0;
	REG_TM0CNT = 0;
	dma[1].cnt = 0;
	soundA.looping = 0;
}

void stopSoundB() {

	soundB.isPlaying = 0;
	REG_TM1CNT = 0;
	dma[2].cnt = 0;
	soundB.looping = 0;
}

void stopSounds() {
    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    REG_TM0CNT = 0;

    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    REG_TM1CNT = 0;
}



void setupInterrupts() {

	REG_IME = 0;

    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;

    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

void interruptHandler() {

	REG_IME = 0;

	if (REG_IF & IRQ_VBLANK) {

        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if(soundA.vBlankCount > soundA.durationInVBlanks) {
                if(soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = 0;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if(soundB.vBlankCount > soundB.durationInVBlanks) {
                if(soundB.looping) {
                    playSoundA(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = 0;
                }
            }
        }

	}
    REG_IF = REG_IF;
    REG_IME = 1;

}