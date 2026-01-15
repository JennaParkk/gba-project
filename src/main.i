# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 51 "mode0.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned char colorIndex);
# 3 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
    int screenx;
    int screeny;
    int health;
    int active;
    int timePassed;
} SPRITE;
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2

# 1 "game.h" 1






extern int energy;


typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;

void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();
int collidesWithBox();
void collectItem();

void initMonster();
void updateMonster();
void drawMonster();

void updateFire();
void activateFire();

void drawHealth();
void drawEnergy();

void initEnemies();
void updateEnemies();
void drawEnemies();

void drawCastle();



typedef enum {ENERGY, WEAPON, SHIELD} ITEM;

typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
    int screenx;
    int screeny;
    int health;
    int startingY;
    int timePassed;
    int damageTimer;
} SPRITE_CUSTOM;

SPRITE_CUSTOM player;
SPRITE_CUSTOM monster;


typedef struct {

    int x;
    int y;
    int width;
    int height;
    int screenx;
    int screeny;
    int active;
    int erased;
    int item;

} BOX;



typedef struct {

    int x;
    int y;
    int width;
    int height;
    int screenx;
    int screeny;
    int active;
    int erased;
    int timePassed;


} POWER;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int numFrames;
    int timeUntilNextFrame;
    int currentFrame;
    int screenx;
    int screeny;
    int active;
    int direction;
} ENEMY;

typedef struct {
    int x;
    int y;
    int width;
    int height;
} SPIKE;


typedef struct {
    int x;
    int y;
    int width;
    int height;
    int xVel;
    int yVel;
    int active;
    int screenx;
    int screeny;
    int numFrames;
    int timeUntilNextFrame;
    int currentFrame;
    int direction;
    int startingY;
    int startingX;
    int collected;

    int returning;

} AXE;



void initAxe();
void updateAxe();
void drawAxe();


void initBoxes();
void updateBoxes(int boxNum);
void drawBoxes();

void initSpikes();
int collidesWithSpike();

int collidesWithLadder();
void playerAttack();

int checkMonster();

void initPower();
void updatePower();
void drawPower();

void weaponCheck();

void drawMonsterHealth();

void turnOnCheat();
# 7 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[672];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 8 "main.c" 2

# 1 "bgStart.h" 1
# 22 "bgStart.h"
extern const unsigned short bgStartTiles[1360];


extern const unsigned short bgStartMap[1024];


extern const unsigned short bgStartPal[256];
# 10 "main.c" 2
# 1 "startScreen.h" 1
# 22 "startScreen.h"
extern const unsigned short startScreenTiles[2144];


extern const unsigned short startScreenMap[1024];


extern const unsigned short startScreenPal[256];
# 11 "main.c" 2
# 1 "bgPause.h" 1
# 22 "bgPause.h"
extern const unsigned short bgPauseTiles[3168];


extern const unsigned short bgPauseMap[1024];


extern const unsigned short bgPausePal[256];
# 12 "main.c" 2
# 1 "bgLose.h" 1
# 22 "bgLose.h"
extern const unsigned short bgLoseTiles[736];


extern const unsigned short bgLoseMap[1024];


extern const unsigned short bgLosePal[256];
# 13 "main.c" 2
# 1 "loseScreen.h" 1
# 22 "loseScreen.h"
extern const unsigned short loseScreenTiles[2528];


extern const unsigned short loseScreenMap[1024];


extern const unsigned short loseScreenPal[256];
# 14 "main.c" 2
# 1 "instruction1.h" 1
# 22 "instruction1.h"
extern const unsigned short instruction1Tiles[4720];


extern const unsigned short instruction1Map[1024];


extern const unsigned short instruction1Pal[256];
# 15 "main.c" 2
# 1 "spritesheet2.h" 1
# 21 "spritesheet2.h"
extern const unsigned short spritesheet2Tiles[16384];


extern const unsigned short spritesheet2Pal[16];
# 16 "main.c" 2
# 1 "bgWin.h" 1
# 22 "bgWin.h"
extern const unsigned short bgWinTiles[992];


extern const unsigned short bgWinMap[1024];


extern const unsigned short bgWinPal[256];
# 17 "main.c" 2
# 1 "winScreen.h" 1
# 22 "winScreen.h"
extern const unsigned short winScreenTiles[1664];


extern const unsigned short winScreenMap[1024];


extern const unsigned short winScreenPal[256];
# 18 "main.c" 2
# 1 "forEva.h" 1
# 21 "forEva.h"
extern const unsigned short forEvaTiles[4096];


extern const unsigned short forEvaPal[256];
# 19 "main.c" 2

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
# 21 "main.c" 2
# 1 "gameTrack1.h" 1


extern const unsigned int gameTrack1_sampleRate;
extern const unsigned int gameTrack1_length;
extern const signed char gameTrack1_data[];
# 22 "main.c" 2
# 1 "play.h" 1





typedef struct {
    unsigned int sampleRate;
    unsigned int length;
    signed char* data;
} SONG;

SONG songs[2];

void init();
void playSong(int);
# 23 "main.c" 2



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




    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short*) 0x04000130);

        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);

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

    (*(volatile unsigned short*) 0x04000000) = ((0) & 7);

    mgba_open();
    bgTimer = 50;

    setupSounds();
    setupInterrupts();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);


    hideSprites();

    goToStart();

}

void goToStart() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4)));

    (*(volatile unsigned short*) 0x04000010) = 0;





    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((31) << 8) | (0 << 14);
    (*(volatile unsigned short*) 0x0400000A) = ((1) << 2) | ((30) << 8) | (0 << 14);

    DMANow(3, startScreenPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, startScreenTiles, &((CB*) 0x06000000)[0], 4288 / 2);
    DMANow(3, startScreenMap, &((SB*) 0x06000000)[31], 2048 / 2);

    DMANow(3, bgStartPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, bgStartTiles, &((CB*) 0x06000000)[1], 2720 / 2);
    DMANow(3, bgStartMap, &((SB*) 0x06000000)[30], 2048 / 2);

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);



    waitForVBlank();

    state = START;
    seed = 0;
    bgTimer = 0;

}

void start() {

    seed++;

    waitForVBlank();

    bgTimer++;
    (*(volatile unsigned short*) 0x04000014) = bgTimer/3;


    if ((!(~(oldButtons) & ((1 << 1))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 1))))) {
        srand(seed);
        goToInstruction();
    }



    if ((!(~(oldButtons) & ((1 << 0))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 0))))) {

        initGame();
        srand(seed);
        playSoundA(gameTrack1_data, gameTrack1_length, 1);
        goToGame();

    }


}

void goToInstruction() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4)));

    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000010) = 0;

    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((31) << 8) | (0 << 14);

    DMANow(3, instruction1Pal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, instruction1Tiles, &((CB*) 0x06000000)[0], 9440 / 2);
    DMANow(3, instruction1Map, &((SB*) 0x06000000)[31], 2048 / 2);

    waitForVBlank();

    state = INSTRUCTION;

}

void instruction() {

    if ((!(~(oldButtons) & ((1 << 0))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 0))))) {
        initGame();
        goToGame();



    }

    if ((!(~(oldButtons) & ((1 << 2))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 2))))) {
        goToStart();
    }

}

void goToGame() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4))) | (1 << 12);

    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000010) = 0;

    hideSprites();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 256);

    waitForVBlank();

    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (2 << 14) | (0 << 7);




    state = GAME;

}

void game() {

    updateGame();
    drawGame();

    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 256);




    if ((!(~(oldButtons) & ((1 << 3))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 3))))) {
        goToPause();
    }


    if ((!(~(oldButtons) & ((1 << 9))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 9))))) {
        turnOnCheat();
    }




    if (monster.health == 0) {
        goToWin();
        stopSounds();
    }




    if (player.health == 0) {
        goToLose();
        stopSounds();
    }

}

void goToPause() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((31) << 8) | (0 << 14);

    DMANow(3, bgPausePal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, bgPauseTiles, &((CB*) 0x06000000)[0], 6336 / 2);
    DMANow(3, bgPauseMap, &((SB*) 0x06000000)[31], 2048 / 2);

    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000010) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);

    waitForVBlank();


    state = PAUSE;


}

void pause() {

    waitForVBlank();

    if ((!(~(oldButtons) & ((1 << 3))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 3))))) {

        DMANow(3, forEvaPal, ((unsigned short*) 0x05000000), 512 / 2);



        goToGame();
    }

    if ((!(~(oldButtons) & ((1 << 2))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 2))))) {
        goToStart();
    }


}

void goToWin() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((31) << 8) | (0 << 14);
    (*(volatile unsigned short*) 0x0400000A) = ((1) << 2) | ((30) << 8) | (0 << 14);


    DMANow(3, winScreenPal, ((unsigned short*) 0x05000000), 256);

    DMANow(3, winScreenTiles, &((CB*) 0x06000000)[0], 3328 / 2);
    DMANow(3, winScreenMap, &((SB*) 0x06000000)[31], 2048 / 2);

    DMANow(3, bgWinPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, bgWinTiles, &((CB*) 0x06000000)[1], 1984 / 2);
    DMANow(3, bgWinMap, &((SB*) 0x06000000)[30], 2048 / 2);

    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;

    hideSprites();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    waitForVBlank();

    state = WIN;
    seed = 0;
    bgTimer = 0;


}

void win() {

    bgTimer--;
    (*(volatile unsigned short*) 0x04000014) = bgTimer / 3;

    hideSprites();

    if ((!(~(oldButtons) & ((1 << 3))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 3))))) {
        goToStart();
    }

}

void goToLose() {

    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((31) << 8) | (0 << 14);

    DMANow(3, loseScreenPal, ((unsigned short*) 0x05000000), 256);
    DMANow(3, loseScreenTiles, &((CB*) 0x06000000)[0], 5056 / 2);
    DMANow(3, loseScreenMap, &((SB*) 0x06000000)[31], 2048 / 2);

    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    waitForVBlank();

    state = LOSE;
    seed = 0;

}

void lose() {

    hideSprites();

    if ((!(~(oldButtons) & ((1 << 3))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 3))))) {
        goToStart();
    }

}
