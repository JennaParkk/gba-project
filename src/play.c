#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"

#include "play.h"
#include "sound.h"

#include "gba.h"
#include "mode0.h"

#include "gameTrack1.h"

SONG songs[SONGCOUNT];
int intensity[10];

void init() {

    for (int i = 0; i < 10; i++) {
        intensity[i] = 0;

    }

    songs[0].sampleRate = gameTrack1_sampleRate;
    songs[0].length = gameTrack1_length;
    songs[0].data = (signed char*) gameTrack1_data;
} 

void playSong(int s) {

    playSoundA(songs[s].data, songs[s].length, 0);

    REG_TM2CNT = 0;
    REG_TM2D = 65536 - 16384;
    
    REG_TM3CNT = 0;
    REG_TM3D = 65536 - 60;

    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}