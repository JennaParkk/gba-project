#ifndef PLAY_H
#define PLAY_H

#define SONGCOUNT 1

typedef struct {
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
} SONG;

SONG songs[SONGCOUNT];

void init();
void playSong(int);

#endif