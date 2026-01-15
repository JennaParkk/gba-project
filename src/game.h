#ifndef GAME_H
#define GAME_H

#define MAPWIDTH 256
#define MAPHEIGHT 512

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

//176 439

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
// box1: 40
// box2: 42

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

#define AXCOUNT 5

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

#endif 