# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short* videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "sound.c" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
void setupSounds();
void interruptHandler();
void setupInterrupts();
# 52 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "sound.c" 2


void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);
 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}



void playSoundA(const signed char* data, int dataLength, int looping) {

    int cyclesPerSample = (16777216)/11025;


    dma[1].cnt = 0;
    DMANow(1, data, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    (*(volatile unsigned short*) 0x04000102) = 0;
    (*(volatile unsigned short*) 0x04000100) = -cyclesPerSample;
    (*(volatile unsigned short*) 0x04000102) = (1 << 7);


    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.looping = looping;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = ((59.727) * dataLength) / 11025;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char* data, int dataLength, int looping) {

    int cyclesPerSample = (16777216)/11025;

    dma[2].cnt = 0;
    DMANow(2, data, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));


    (*(volatile unsigned short*) 0x04000106) = 0;
    (*(volatile unsigned short*) 0x04000104) = -cyclesPerSample;
    (*(volatile unsigned short*) 0x04000106) = (1 << 7);


    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.looping = looping;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = ((59.727) * dataLength) / 11025;
    soundB.vBlankCount = 0;
}


void pauseSoundA() {

 soundA.isPlaying = 0;
 (*(volatile unsigned short*) 0x04000102) = 0;
}

void pauseSoundB() {

 soundB.isPlaying = 0;
 (*(volatile unsigned short*) 0x04000106) = 0;
}




void unpauseSoundA() {

 soundA.isPlaying = 1;
 (*(volatile unsigned short*) 0x04000102) = (1 << 7);
}

void unpauseSoundB() {

 soundB.isPlaying = 1;
 (*(volatile unsigned short*) 0x04000106) = (1 << 7);
}




void stopSoundA() {

 soundA.isPlaying = 0;
 (*(volatile unsigned short*) 0x04000102) = 0;
 dma[1].cnt = 0;
 soundA.looping = 0;
}

void stopSoundB() {

 soundB.isPlaying = 0;
 (*(volatile unsigned short*) 0x04000106) = 0;
 dma[2].cnt = 0;
 soundB.looping = 0;
}

void stopSounds() {
    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    (*(volatile unsigned short*) 0x04000102) = 0;

    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    (*(volatile unsigned short*) 0x04000106) = 0;
}



void setupInterrupts() {

 (*(unsigned short*) 0x04000208) = 0;

    (*(unsigned short*) 0x04000200) = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    (*(unsigned short*) 0x04000004) = (1 << 3);

    (*(ihp*) 0x03007FFC) = &interruptHandler;

 (*(unsigned short*) 0x04000208) = 1;

}

void interruptHandler() {

 (*(unsigned short*) 0x04000208) = 0;

 if ((*(volatile unsigned short*) 0x04000202) & (1 << 0)) {

        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if(soundA.vBlankCount > soundA.durationInVBlanks) {
                if(soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    (*(volatile unsigned short*) 0x04000102) = 0;
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
                    (*(volatile unsigned short*) 0x04000106) = 0;
                }
            }
        }

 }
    (*(volatile unsigned short*) 0x04000202) = (*(volatile unsigned short*) 0x04000202);
    (*(unsigned short*) 0x04000208) = 1;

}
