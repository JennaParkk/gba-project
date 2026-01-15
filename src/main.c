#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"

#include "game.h"
#include "pauseScreen.h"

#include "bgStart.h"
#include "startScreen.h"
#include "bgPause.h"
#include "bgLose.h"
#include "loseScreen.h"
#include "instruction1.h"
#include "spritesheet2.h"
#include "bgWin.h"
#include "winScreen.h"
#include "forEva.h"

#include "sound.h"
#include "gameTrack1.h"
#include "play.h"



void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToWin();
void win();
void goToLose();
void lose();
void goToPause();
void pause();
void goToInstruction();
void instruction();

void srand();

int seed;
int bgTimer;
int bgTimer2;


enum {
    START,
    INSTRUCTION,
    GAME,
    PAUSE,
    WIN,
    LOSE
};

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

int state;


int main() {

    initialize();

    //oldButtons = buttons;
    //buttons = REG_BUTTONS;

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);

        switch (state) {
            case START:
                start();
                break;
            case INSTRUCTION:
                instruction();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();

        }
    }
    
}

void initialize() {

    REG_DISPCTL = MODE(0);

    mgba_open();
    bgTimer = 50;

    setupSounds();
    setupInterrupts();

    DMANow(3, shadowOAM, OAM, 512);
    // DMANow(3, shadowOAM, OAM, 256);

    hideSprites();

    goToStart();

}

void goToStart() {

    REG_DISPCTL = BG_ENABLE(0) | BG_ENABLE(1);

    REG_BG0HOFF = 0;
 
    //hideSprites();
    //DMANow(3, shadowOAM, OAM, 512);
    
    // start screen set up
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL;

    DMANow(3, startScreenPal, BG_PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen / 2);

    DMANow(3, bgStartPal, BG_PALETTE, 256);
    DMANow(3, bgStartTiles, &CHARBLOCK[1], bgStartTilesLen / 2);
    DMANow(3, bgStartMap, &SCREENBLOCK[30], bgStartMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    // DMANow(3, shadowOAM, OAM, 256);

    waitForVBlank();

    state = START;
    seed = 0;
    bgTimer = 0;

}

void start() {

    seed++;

    waitForVBlank();

    bgTimer++;
    REG_BG1HOFF = bgTimer/3;

    // instruction screen
    if (BUTTON_PRESSED(BUTTON_B)) {
        srand(seed);
        goToInstruction();
    }


    // game starts
    if (BUTTON_PRESSED(BUTTON_A)) {

        initGame();
        srand(seed);
        playSoundA(gameTrack1_data, gameTrack1_length, 1);
        goToGame();

    }

    
}

void goToInstruction() {

    REG_DISPCTL = BG_ENABLE(0);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    DMANow(3, instruction1Pal, BG_PALETTE, 256);
    DMANow(3, instruction1Tiles, &CHARBLOCK[0], instruction1TilesLen / 2);
    DMANow(3, instruction1Map, &SCREENBLOCK[31], instruction1MapLen / 2);

    waitForVBlank();

    state = INSTRUCTION;

}

void instruction() {

    if (BUTTON_PRESSED(BUTTON_A)) {
        initGame();
        goToGame();
        
        // sound

    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}

void goToGame() {

    REG_DISPCTL = BG_ENABLE(0) | SPRITE_ENABLE;

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    hideSprites();
    //DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, shadowOAM, OAM, 256);

    waitForVBlank();

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_TALL | BG_4BPP;

    
    // REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_TALL | BG_4BPP;

    state = GAME;
    
}

void game() {

    updateGame();
    drawGame();

    waitForVBlank();
    //DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, shadowOAM, OAM, 256);


    // go to pause 
    // if start button is pressed 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // cheat
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        turnOnCheat();
    }


    // win condition
    // monster.health == 0
    if (monster.health == 0) {
        goToWin();
        stopSounds();
    }
    
    
    // lose condition
    // player.health == 0
    if (player.health == 0) {
        goToLose();
        stopSounds();
    }

}

void goToPause() {

    REG_DISPCTL = BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    DMANow(3, bgPausePal, BG_PALETTE, 256);
    DMANow(3, bgPauseTiles, &CHARBLOCK[0], bgPauseTilesLen / 2);
    DMANow(3, bgPauseMap, &SCREENBLOCK[31], bgPauseMapLen / 2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    waitForVBlank();


    state = PAUSE;


}

void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {

        DMANow(3, forEvaPal, BG_PALETTE, forEvaPalLen / 2);
        // DMANow(3, spritesheet2Pal, SPRITE_PALETTE, 256);
        
        // sound
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }


}

void goToWin() {

    REG_DISPCTL = BG_ENABLE(0) | BG_ENABLE(1);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL;
    

    DMANow(3, winScreenPal, BG_PALETTE, 256);
    // DMANow(3, spritesheet2Pal, SPRITE_PALETTE, 256);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen / 2);
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen / 2);

    DMANow(3, bgWinPal, BG_PALETTE, 256);
    DMANow(3, bgWinTiles, &CHARBLOCK[1], bgWinTilesLen / 2);
    DMANow(3, bgWinMap, &SCREENBLOCK[30], bgWinMapLen / 2);

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    hideSprites();

    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();

    state = WIN;
    seed = 0;
    bgTimer = 0;
    

}

void win() {

    bgTimer--;
    REG_BG1HOFF = bgTimer / 3;

    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}

void goToLose() {

    REG_DISPCTL = BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    DMANow(3, loseScreenPal, BG_PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();

    state = LOSE;
    seed = 0;

}

void lose() {

    hideSprites();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}





