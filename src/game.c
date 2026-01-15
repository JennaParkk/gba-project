#include "gba.h"
#include "game.h"
#include "mode0.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>
#include "sprites.h"

#include "collisionmap2.h"
#include "forEva.h"
#include "practice.h"
#include "practiceFinal.h"
#include "spritesheet2.h"

#define MAPWIDTH 256
#define MAPHEIGHT 512

int hOff;
int vOff;

int energy;

int playerSprite = 0;

SPRITE_CUSTOM player;
SPRITE_CUSTOM monster;
SPRITE fire;

AXE axe;

BOX box1;
BOX box2;
BOX box3;


POWER power1;
POWER power2;
POWER power3;
POWER power4;
POWER power5;


SPIKE spike1, spike2, spike3, spike4, spike5, spike6, spike7, spike8, spike9, spike10;

ENEMY enemy1, enemy2, enemy3;

int cheat;


inline unsigned char colorAt(int x, int y){

    unsigned char* ptr = (unsigned char*) collisionmap2Bitmap;
    return ptr[OFFSET(x, y, MAPWIDTH)];

}

void initGame() {

    DMANow(3, forEvaTiles, &CHARBLOCK[0], forEvaTilesLen/2);
    ///////// 

    // DMANow(3, forEvaTiles, &CHARBLOCK[2], forEvaTilesLen / 2);
    DMANow(3, forEvaPal, BG_PALETTE, forEvaPalLen / 2); 

    DMANow(3, practiceFinalMap, &SCREENBLOCK[28], practiceFinalMapLen/2);
    // DMANow(3, practiceFinalMap, &SCREENBLOCK[31], practiceFinalMapLen / 2);

    DMANow(3, spritesheet2Tiles, &CHARBLOCK[4], spritesheet2TilesLen/2);
    DMANow(3, spritesheet2Pal, SPRITE_PALETTE, 256);


    REG_DISPCTL = BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_TALL | SPRITE_ENABLE;
    //REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_TALL | SPRITE_ENABLE;

    // DMANow(3, forEvaPal, BG_PALETTE, 256);

    initPlayer();
    initMonster();
    initBoxes();
    initEnemies();
    initSpikes();
    initAxe();
    initPower();

    cheat = 0;

}

void initPlayer() {

    player.width = 16;
    player.height = 16; 
    player.x = 8;
    player.y = 400;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 2;
    player.yVel = 1;
    player.health = 5;

    energy = 0;

}

void initMonster() {

    monster.width = 16;
    monster.height = 16;  
    monster.x = 210;
    monster.y = 18;
    monster.numFrames = 3;
    monster.direction = LEFT;
    monster.timeUntilNextFrame = 15;
    monster.currentFrame = 0;
    monster.xVel = 1;
    monster.yVel = 1;
    monster.health = 3;
    monster.startingY = monster.y;
    monster.timePassed = 4;
    monster.damageTimer = 0;

    fire.width = 16;
    fire.height = 8;
    fire.x = 210 - fire.width;
    fire.y = 24;
    fire.numFrames = 3;
    fire.direction = LEFT;
    fire.timeUntilNextFrame = 15;
    fire.currentFrame = 0;
    fire.xVel = 2;
    fire.yVel = 0;


}

void updateGame() {

    updatePlayer();
    updateMonster();

    updateEnemies();
    updateAxe();
    

}

void updatePlayer() {

    player.isAnimating = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1 ;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;
    

    // y direction - constant velocity
    if (!collidesWithLadder() && (player.y + player.height < MAPHEIGHT)) {

        if (colorAt(leftX, bottomY + 4) && colorAt(rightX, bottomY + 4)) {

            player.y += 4;

        } else if (colorAt(leftX, bottomY + 3) && colorAt(rightX, bottomY + 3)) {

            player.y += 3;

        } else if (colorAt(leftX, bottomY + 2) && colorAt(rightX, bottomY + 2)) {

            player.y += 2;

        } else if (colorAt(leftX, bottomY + 1) && colorAt(rightX, bottomY + 1)) {

            player.y += 1;

        }
        
    }
    ////////////////////////////////////////////////////////////////////////////

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.direction = RIGHT;
        player.isAnimating = 1;

        if (player.x < MAPWIDTH - player.width && colorAt(rightX + player.xVel, topY)
         && colorAt(rightX + player.xVel, bottomY)) {
            player.x += player.xVel;
        }
    }


    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.direction = LEFT;
        player.isAnimating = 1;

        if (player.x >= 0 && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
            player.x -= player.xVel;
        }
        
    }
    
    ////////////////////////////////////////////////////////////////////
    ///////////////// collision check with ladders /////////////////////
   
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.direction = DOWN;
        player.isAnimating = 1;

        if (player.y + player.height < MAPHEIGHT && colorAt(leftX, bottomY + player.yVel) &&
            colorAt(rightX, bottomY + player.yVel) && collidesWithLadder()) {
                player.y += player.yVel;
            }
    }


    if (BUTTON_HELD(BUTTON_UP)) {

        player.direction = UP;
        player.isAnimating = 1;

        if (player.y >= 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel) && collidesWithLadder()) {
            player.y -= player.yVel;
        }
    } 

    ////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////

    hOff = player.x - (SCREENWIDTH - player.width) / 2;
    vOff = player.y - (SCREENHEIGHT - player.height) / 2;


    ////////// jumping ///////////////
    if (BUTTON_HELD(BUTTON_B)) {

        if (!collidesWithLadder() && player.y >= 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel)) {

                player.y -= 7;

            }
    }
    ////////////////////////////////////

    // collision check w/ enemy1

    if (enemy1.active && !cheat) {
        if (collision(player.x, player.y, player.width, player.height, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            enemy1.active = 0;
            player.health--;
        }
    }

    // collision check w/ enemy2
    if (enemy2.active && !cheat) {
        if (collision(player.x, player.y, player.width, player.height, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            enemy2.active = 0;
            player.health--;
        }
    }

    /////////////////////////////////////////////////
    // check if player collies with a box
    // if true
    // updateBoxes

    int boxNumber = collidesWithBox();

    // collides w/ box 1 (weapon) 
    if (boxNumber == 1 && box1.active) {
        playerSprite = 8;
        axe.collected = 1;
    }

    // collides w/ box2 (energy)
    /*if (boxNumber == 2 && box2.active) {
        energy++;
    }*/

    if (boxNumber != -1) {
        updateBoxes(boxNumber);
    }

    ///////////////////////////////////////////////////

    /////////////////////////////////////////////////
    // collision check w/ power 1, 2, 3, 4, 5 //////////
    /////////////////////////////////////////////////
    updatePower();
    if (energy == 5) {
        player.health++;
    }


    /////////////////////////////////////////
    //////// player attacks ////////////////
    if (BUTTON_PRESSED(BUTTON_A) && !axe.active && axe.collected) {
        axe.active = 1;
        axe.returning = 0;

        if (player.direction == LEFT) {

            axe.direction = LEFT;
            axe.x = player.x;

        } else {

            axe.direction = RIGHT;
            axe.x = player.x + player.width;

        }

        axe.y = player.y;

        axe.startingY = axe.y;
        axe.startingX = axe.x;
    }


    ////////////////////////////////


    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0){

             if (collidesWithSpike() == 1 && !cheat) {           
                player.health--;
            }

            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 10;
        }
    } else if (!player.isAnimating) {

        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;

    }

    // center screen on player
    if (vOff + SCREENHEIGHT >= 512) {
        vOff = 512 - SCREENHEIGHT;
    }

    if (vOff < 0 ) {
        vOff = 0;
    }

    if (hOff + SCREENWIDTH >= 256) {
        hOff = 256 - SCREENWIDTH;
    }

    if (hOff < 0) {
        hOff = 0;
    }


    
}


void updateMonster() {

    monster.isAnimating = 1;

    if (monster.damageTimer > 0) {
        monster.damageTimer--;
    }

    int hoverRange = 2;  
    int hoverDirection = 1;  

    int leftX = monster.x;
    int rightX = monster.x + monster.width - 1 ;
    int topY = monster.y;
    int bottomY = monster.y + monster.height - 1;

    if (player.y <= 40) {
        if (player.x > monster.x && (monster.x + monster.width <= SCREENWIDTH - 40)) {
            monster.x += monster.xVel;
            monster.direction = RIGHT;
        } else if (player.x < monster.x && monster.x > 80) {
            monster.x -= monster.xVel;
            monster.direction = LEFT;
        }

        activateFire();  
    }

    
    if (monster.y + hoverRange >= monster.startingY + hoverRange && hoverDirection == 1) {
        hoverDirection = -1; 
    } else if (monster.y - hoverRange <= monster.startingY - hoverRange && hoverDirection == -1) {
        hoverDirection = 1; 
    }

    monster.y += monster.yVel * hoverDirection; 

    monster.screenx = monster.x;
    monster.screeny = monster.y;

    // check if monster collides w/ axe

    if (monster.damageTimer == 0 && checkMonster() == 1) {           
        monster.health--;
        monster.damageTimer = monster.timePassed;  
    }


    /*monster.timePassed--;
        if (monster.timePassed == 0){

            if (checkMonster() == 1) {           
                monster.health--;
            }

            monster.timePassed = 5;
        }
    */

    int fire_leftX = fire.x;
    int fire_rightX = fire.x + fire.width - 1 ;
    int fire_topY = fire.y;
    int fire_bottomY = fire.y + fire.height - 1;

    updateFire();

}

void updateFire() {

    if (fire.active) {
        
        if (fire.direction == LEFT) {
            fire.x -= fire.xVel; // Move fire left
        } else {
            fire.x += fire.xVel; // Move fire right
        }

        // check for collision w/ the player
        if (collision(fire.x, fire.y, fire.width, fire.height, player.x, player.y, player.width, player.height)) {
            fire.active = 0; 
            player.health--; 
        }

        // boundary check
        if (fire.x < 0 || fire.x > MAPWIDTH - fire.width) {
            fire.active = 0;
        }

    }

}

void activateFire() {

    if (!fire.active) {
        fire.active = 1;
        fire.x = monster.x + (monster.direction == LEFT ? -fire.width : monster.width); 
        fire.y = monster.y + monster.height / 2 - fire.height / 2; 
        fire.direction = monster.direction; 

        fire.screenx = fire.x;
        fire.screeny = fire.y;
    }

}

void drawGame() {

    DMANow(3, forEvaTiles, &CHARBLOCK[0], forEvaTilesLen/2);
    ///////// 

    // DMANow(3, forEvaTiles, &CHARBLOCK[2], forEvaTilesLen / 2);
    DMANow(3, forEvaPal, BG_PALETTE, forEvaPalLen / 2); 

    DMANow(3, practiceFinalMap, &SCREENBLOCK[28], practiceFinalMapLen/2);
    // DMANow(3, practiceFinalMap, &SCREENBLOCK[31], practiceFinalMapLen / 2);

    DMANow(3, spritesheet2Tiles, &CHARBLOCK[4], spritesheet2TilesLen/2);
    DMANow(3, spritesheet2Pal, SPRITE_PALETTE, 256);

    drawCastle();

    drawPlayer();
    drawMonster();

    drawHealth();
    drawBoxes();
    drawPower();
    drawEnergy();

    drawMonsterHealth();

    drawEnemies();

    drawAxe();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    DMANow(3, shadowOAM, OAM, 128*4);



}

void drawCastle() {

    int castleX = 215;
    int castleY = 8;

    //int castleScreenx = castleX - hOff;
    //int castleScreeny = castleY - vOff;

    if (castleX + 32 >= hOff && castleX <= hOff + SCREENWIDTH &&
        castleY + 32 >= vOff && castleY <= vOff + SCREENHEIGHT) {

        int castleScreenx = castleX - hOff;
        int castleScreeny = castleY - vOff;

        shadowOAM[15].attr0 = ATTR0_SQUARE | ATTR0_Y(castleScreeny);
        shadowOAM[15].attr1 = ATTR1_MEDIUM | ATTR1_X(castleScreenx);
        shadowOAM[15].attr2 = ATTR2_TILEID(4, 9);

    }

}

void drawPlayer() {

    if (player.x < SCREENWIDTH) {
        player.screenx = player.x - hOff;
    }

    if (player.x > SCREENWIDTH) {
        player.screenx = player.x - hOff;
    }

    if (player.y < SCREENHEIGHT) {
        player.screeny = player.y - vOff; 
    }

    if (player.y > SCREENHEIGHT) {
        player.screeny = player.y - vOff;
    }



    shadowOAM[13].attr0 = ATTR0_SQUARE | ATTR0_Y(player.screeny);
    shadowOAM[13].attr1 = ATTR1_SMALL | ATTR1_X(player.screenx);
    shadowOAM[13].attr2 = ATTR2_TILEID((player.direction * 2) + playerSprite, player.currentFrame * 2);


}

void drawMonster() {

    if (monster.health != 0) {

        monster.timeUntilNextFrame--;

        if (monster.timeUntilNextFrame == 0) {
            monster.currentFrame = (monster.currentFrame + 1) % monster.numFrames;
            monster.timeUntilNextFrame = 10;
        }

        if (monster.x + monster.width >= hOff && monster.x <= hOff + SCREENWIDTH &&
            monster.y + monster.height >= vOff && monster.y <= vOff + SCREENHEIGHT) {

            monster.screenx = monster.x - hOff;
            monster.screeny = monster.y - vOff;

            shadowOAM[14].attr0 = ATTR0_SQUARE | ATTR0_Y(monster.screeny);

            if (monster.direction == RIGHT) {
                    shadowOAM[14].attr1 = ATTR1_SMALL | ATTR1_X(monster.screenx);
                } else {
                    shadowOAM[14].attr1 = ATTR1_SMALL | ATTR1_X(monster.screenx) | ATTR1_HFLIP;
                }


            shadowOAM[14].attr2 = ATTR2_TILEID(8 + (monster.currentFrame * 2), 6);

        }

    }

    if (fire.active) {
        if (--fire.timeUntilNextFrame == 0) {
            fire.currentFrame = (fire.currentFrame + 1) % fire.numFrames;
            fire.timeUntilNextFrame = 15;
        }

        if (fire.x + fire.width >= hOff && fire.x <= hOff + SCREENWIDTH &&
            fire.y + fire.height >= vOff && fire.y <= vOff + SCREENHEIGHT) {

            fire.screenx = fire.x - hOff;
            fire.screeny = fire.y - vOff;

            shadowOAM[17].attr0 = ATTR0_WIDE | ATTR0_Y(fire.screeny);

            if (fire.direction == RIGHT) {
                    shadowOAM[17].attr1 = ATTR1_TINY | ATTR1_X(fire.screenx);
                } else {
                    shadowOAM[17].attr1 = ATTR1_TINY | ATTR1_X(fire.screenx) | ATTR1_HFLIP;
                }
                

            shadowOAM[17].attr2 = ATTR2_TILEID(8 + (fire.currentFrame * 2), 8);

        }
    }



    

    
}   

void drawHealth() {

    if (player.health > 5) {
        player.health = 5;
    }

    int numEmpty = 5 - player.health;

    // draw heart
    shadowOAM[0].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
    shadowOAM[0].attr1 = ATTR1_TINY | ATTR1_X(0);
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 10);

    for (int i = 0; i < player.health; i++) {
        shadowOAM[i+1].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
        shadowOAM[i+1].attr1 = ATTR1_TINY | ATTR1_X(8 + (8 * i));
        shadowOAM[i+1].attr2 = ATTR2_TILEID(2, 10);

    }

    for (int i = 0; i < numEmpty; i++) {
        shadowOAM[player.health + 1 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
        shadowOAM[player.health + 1 + i].attr1 = ATTR1_TINY | ATTR1_X(8 * (player.health + 1 + i));
        shadowOAM[player.health + 1 + i].attr2 = ATTR2_TILEID(1, 10);
    }
}

int collidesWithLadder() {

    // ladder 1 (player.x, player.y, player.width, player.height, 224, 423, 16, 32)
    // ladder 2 (player.x , player.y, player.width, player.height, 47, 295, 16, 24)
    // ladder 3 (player.x , player.y, player.width, player.height, 232, 151, 16, 73)
    // ladder 4 (player.x , player.y, player.width, player.height, 8, 40, 16, 117)
      

    // check if player collides with ladder 1
    if (collision(player.x, player.y, player.width, player.height, 224, 423, 16, 32) || 
        collision(player.x , player.y, player.width, player.height, 47, 295, 16, 24) ||
        collision(player.x , player.y, player.width, player.height, 232, 151, 16, 73) ||
        collision(player.x , player.y, player.width, player.height, 8, 40, 16, 117)) {

        return 1;

    } else {
        return 0;
    }
      

}

void initBoxes() {

    //176 439
    box1.x = 176;
    box1.y = 439;
    box1.width = 16;
    box1.height = 16;
    box1.active = 1;
    box1.erased = 0;
    box1.item = WEAPON;

    /*box2.x = 232;
    box2.y = 288;
    box2.width = 16;
    box2.height = 16;
    box2.active = 1;
    box2.item = ENERGY;*/

}

void updateBoxes(int boxNum) {

    // collision w/ box 1
    if (boxNum == 1 && box1.active == 1) {
        box1.active = 0;
    }

    // collision w/ box2
    /*if (boxNum == 2 && box2.active == 1) {
        box2.active = 0;
    }*/


}

void drawBoxes() {


    if (box1.active) {

        if (box1.x + box1.width >= hOff && box1.x <= hOff + SCREENWIDTH &&
            box1.y + box1.height >= vOff && box1.y <= vOff + SCREENHEIGHT) {

                box1.screenx = box1.x - hOff;
                box1.screeny = box1.y - vOff;

                shadowOAM[40].attr0 = ATTR0_SQUARE | ATTR0_Y(box1.screeny);
                shadowOAM[40].attr1 = ATTR1_SMALL | ATTR1_X(box1.screenx);
                shadowOAM[40].attr2 = ATTR2_TILEID(0, 8);

            }

    } else {
        shadowOAM[40].attr0 = ATTR0_HIDE;
    }

    /*if (box2.active) {
        if (box2.x + box2.width >= hOff && box2.x <= hOff + SCREENWIDTH &&
            box2.y + box2.height >= vOff && box2.y <= vOff + SCREENHEIGHT) {

                box2.screenx = box2.x - hOff;
                box2.screeny = box2.y - vOff;

                shadowOAM[42].attr0 = ATTR0_SQUARE | ATTR0_Y(box2.screeny);
                shadowOAM[42].attr1 = ATTR1_SMALL | ATTR1_X(box2.screenx);
                shadowOAM[42].attr2 = ATTR2_TILEID(0, 12);

            }
    } else {
        shadowOAM[42].attr0 = ATTR0_HIDE;
    }*/



}


// collision check w/ boxes
// true : returns the box number
// false : returns -1
int collidesWithBox() {

    // check which box (which item)

    // collision check w/ box 1
    if (collision(player.x, player.y, player.width, player.height, box1.x, box1.y, box1.width, box1.height)) {

        return 1;

    } else if (collision(player.x, player.y, player.width, player.height, box2.x, box2.y, box2.width, box2.height)) {
        // collides w/ box 2
        return 2;
    } else if (collision(player.x, player.y, player.width, player.height, box3.x, box3.y, box3.width, box3.height)) {
        // collides w/ box 3
        return 3;
    } else {
        // no collision
        return -1;
    }

}

void drawEnergy() {

    if (energy > 5) {
        energy = 5;
    }


    int numEmpty = 5 - energy;

    // draw bottle
    shadowOAM[6].attr0 = ATTR0_SQUARE | ATTR0_Y(8);
    shadowOAM[6].attr1 = ATTR1_TINY | ATTR1_X(0);
    shadowOAM[6].attr2 = ATTR2_TILEID(0, 11);

    for (int i = 0; i < numEmpty; i++) {
        shadowOAM[energy + 7 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(8);
        shadowOAM[energy + 7 + i].attr1 = ATTR1_TINY | ATTR1_X(8 * (energy + 1 + i));
        shadowOAM[energy + 7 + i].attr2 = ATTR2_TILEID(1, 11);
    }

    for (int i = 0; i < energy; i++) {
        shadowOAM[i+7].attr0 = ATTR0_SQUARE | ATTR0_Y(8);
        shadowOAM[i+7].attr1 = ATTR1_TINY | ATTR1_X(8 + (8 * i));
        shadowOAM[i+7].attr2 = ATTR2_TILEID(2, 11);

    }

}

void initEnemies() {

    enemy1.width = 8;
    enemy1.height = 8;
    enemy1.x = 0;
    enemy1.y = 344;
    enemy1.numFrames = 2;
    enemy1.direction = RIGHT;
    enemy1.timeUntilNextFrame = 15;
    enemy1.currentFrame = 0;
    enemy1.xVel = 1;
    enemy1.active = 1;

    enemy2.width = 8;
    enemy2.height = 8;
    enemy2.x = 96;
    enemy2.y = 144;
    enemy2.numFrames = 2;
    enemy2.direction = RIGHT;
    enemy2.timeUntilNextFrame = 15;
    enemy2.currentFrame = 0;
    enemy2.xVel = 1;
    enemy2.active = 1;



}

void updateEnemies() {

    if (enemy1.active == 1) {

        if (enemy1.direction == RIGHT) {

            if (enemy1.x <= 70) {
                enemy1.x += enemy1.xVel;
            } else {
                enemy1.direction = LEFT;
            }
        } else {

            if (enemy1.x >= 0) {
                enemy1.x -= enemy1.xVel;
            } else {
                enemy1.direction = RIGHT;
            }

        }

    } 

    if (enemy2.active == 1) {

        if (enemy2.direction == RIGHT) {

            if (enemy2.x + enemy2.width <= 168) {
                enemy2.x += enemy2.xVel;
            } else {
                enemy2.direction = LEFT;
            }

        } else {

            if (enemy2.x >= 96) {
                enemy2.x -= enemy2.xVel;
            } else {
                enemy2.direction = RIGHT;
            }

        }

        // enemy2.screenx = enemy2.x;
        // enemy2.screeny = enemy2.y;

    } 



}

void drawEnemies() {

    if (enemy1.active) {
        enemy1.timeUntilNextFrame--;
        if (enemy1.timeUntilNextFrame == 0) {
            enemy1.currentFrame = (enemy1.currentFrame + 1) % enemy1.numFrames;
            enemy1.timeUntilNextFrame = 10;
        } 
        if (enemy1.x + enemy1.width >= hOff && enemy1.x <= hOff + SCREENWIDTH &&
            enemy1.y + enemy1.height >= vOff && enemy1.y <= vOff + SCREENHEIGHT) {
                enemy1.screenx = enemy1.x - hOff;
                enemy1.screeny = enemy1.y - vOff;

                shadowOAM[41].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy1.screeny);

                if (enemy1.direction == RIGHT) {
                    shadowOAM[41].attr1 = ATTR1_TINY | ATTR1_X(enemy1.screenx);
                } else {
                    shadowOAM[41].attr1 = ATTR1_TINY | ATTR1_X(enemy1.screenx) | ATTR1_HFLIP;
                }

                shadowOAM[41].attr2 = ATTR2_TILEID(4 + enemy1.currentFrame, 6);
            }


    } else {

        shadowOAM[41].attr0 = ATTR0_HIDE;

    }

    // enemy 2

    if (enemy2.active) {
        enemy2.timeUntilNextFrame--;
        if (enemy2.timeUntilNextFrame == 0) {
            enemy2.currentFrame = (enemy2.currentFrame + 1) % enemy2.numFrames;
            enemy2.timeUntilNextFrame = 10;
        } 
        if (enemy2.x + enemy2.width >= hOff && enemy2.x <= hOff + SCREENWIDTH &&
            enemy2.y + enemy2.height >= vOff && enemy2.y <= vOff + SCREENHEIGHT) {
                enemy2.screenx = enemy2.x - hOff;
                enemy2.screeny = enemy2.y - vOff;

                shadowOAM[18].attr0 = ATTR0_SQUARE | ATTR0_Y(enemy2.screeny);

                if (enemy2.direction == RIGHT) {
                    shadowOAM[18].attr1 = ATTR1_TINY | ATTR1_X(enemy2.screenx);
                } else {
                    shadowOAM[18].attr1 = ATTR1_TINY | ATTR1_X(enemy2.screenx) | ATTR1_HFLIP;
                }

                shadowOAM[18].attr2 = ATTR2_TILEID(6 + enemy2.currentFrame, 6);
            }


    } else {

        shadowOAM[18].attr0 = ATTR0_HIDE;

    }


}

void initSpikes() {

    spike1.x = 104;
    spike1.y = 424;
    spike1.width = 23;
    spike1.height = 14;

    spike2.x = 152;
    spike2.y = 472;
    spike2.width = 16;
    spike2.height = 16;

    spike3.x = 192;
    spike3.y = 472;
    spike3.width = 16;
    spike3.height = 16;

    spike4.x = 136;
    spike4.y = 393;
    spike4.width = 23;
    spike4.height = 16;

    // 148, 298
    spike5.x = 148;
    spike5.y = 298;
    spike5.width = 12;
    spike5.height = 8;

    //196 265
    spike6.x = 196;
    spike6.y = 265;
    spike6.width = 24;
    spike6.height = 16;

    //173 128
    spike7.x = 173;
    spike7.y = 128;
    spike7.width = 9;
    spike7.height = 8;

    // 154 88
    spike8.x = 154;
    spike8.y = 88;
    spike8.width = 14;
    spike8.height = 14;

    // 168 88
    spike9.x = 168;
    spike9.y = 88;
    spike9.width = 12;
    spike9.height = 8;

    // 82 184
    spike10.x = 82;
    spike10.y = 184;
    spike10.width = 12;
    spike10.height = 8;

}

int collidesWithSpike() {

    if (collision(player.x, player.y, player.width, player.height, spike1.x, spike1.y, spike1.width, spike1.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike2.x, spike2.y, spike2.width, spike2.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike3.x, spike3.y, spike3.width, spike3.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike4.x, spike4.y, spike4.width, spike4.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike5.x, spike5.y, spike5.width, spike5.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike6.x, spike6.y, spike6.width, spike6.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike7.x, spike7.y, spike7.width, spike7.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike8.x, spike8.y, spike8.width, spike8.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike9.x, spike9.y, spike9.width, spike9.height)) {
        return 1;
    } else if (collision(player.x, player.y, player.width, player.height, spike10.x, spike10.y, spike10.width, spike10.height)) {
        return 1;
    } else {
        return -1;
    }

}

/*void initAxes() {

    for (int i = 0; i < AXCOUNT; i++) {
        axes[i].active = 0;
        axes[i].x = 0;
        axes[i].y = 0;
        axes[i].width = 8;
        axes[i].height = 8;

        axes[i].pre_x = 0;
        axes[i].pre_y = 0;
        axes[i].x_limit = 40;

        axes[i].xVel = 2;
        axes[i].yVel = 1;

    }
}*/

/*void axLimitCheck(AX* a) {

    /*a->y_limit = a->x_limit/2;

    if (a->direction == RIGHT) {

        if (a->x <= a->x_limit) {
            // move up if within y boundary
            if (a->y - a->yVel >= 0) {
                a->y -= a->yVel;
            }

            // move right if within screen width
            if (a->x + a->xVel <= SCREENWIDTH) {
                a->x += a->xVel;
            } else {
                a->active = 0;
            }
        } else {
            // move down if within a different y boundary
            if (a->y + a->yVel <= 40) {
                a->y += a->yVel;
            } else {
                a->active = 0;
            }

            // check for moving right within screen width
            if (a->x + a->xVel <= SCREENWIDTH) {
                a->x += a->xVel;
            } else {
                a->active = 0;
            }
        }
    } else if (a->direction == LEFT) {
        a->y_limit = a->x_limit/2;

        if (a->x >= 0) {
            if (a->y - a->yVel >= 0) {
                a->y -= a->yVel;
            }

            // move left if within the left boundary
            if (a->x - a->xVel >= 0) {
                a->x -= a->xVel;
            } else {
                a->active = 0;
            }
        } else {
            // move down
            if (a->y + a->yVel <= 40) {
                a->y += a->yVel;
            }

            // check for moving left
            if (a->x - a->xVel >= 0) {
                a->x -= a->xVel;
            } else {
                a->active = 0;
            }
        }
    }*/

/*void axLimitCheck(AX* a) {
    a->y_limit = a->x_limit / 2;

    if (a->direction == RIGHT) {

        if (a->x + a->xVel <= SCREENWIDTH) {
            a->x += a->xVel;
            a->y += (a->x <= (a->x + a->x_limit)) ? -a->yVel : a->yVel;
        } else {
            a->active = 0;
        }

    } else if (a->direction == LEFT) {

        if (a->x - a->xVel >= 0) {
            a->x -= a->xVel;
            a->y += (a->x >= (a->x - a->x_limit)) ? a->yVel : -a->yVel;
        } else {
            a->active = 0;
        }

    }   

    
    if (a->y < 0 || a->y > 40) { 
        a->active = 0;
    }

}*/

/*void axLimitCheck(AX* a) {
    a->y_limit = a->x_limit / 2;

    if (a->direction == RIGHT) {
        if (a->x + a->xVel <= SCREENWIDTH) {
            a->x += a->xVel;
            a->y += (a->x <= a->x_limit) ? -a->yVel : a->yVel;
        } else {
            a->active = 0;
        }
    } else if (a->direction == LEFT) {
        if (a->x - a->xVel >= 0) {
            a->x -= a->xVel;
            a->y += (a->x >= a->x_limit) ? -a->yVel : a->yVel;
        } else {
            a->active = 0;
        }
    }

    if (a->y < 0 || a->y > 40) {
        a->active = 0;
    }
}*/

/*void drawAxes() {

    for (int i = 0; i < AXCOUNT; i++) {
        if (axes[i].active) {

            if (axes[i].x + axes[i].width <= hOff && axes[i].x <= hOff + SCREENWIDTH &&
                axes[i].y + axes[i].height <= vOff && axes[i].y <= vOff + SCREENHEIGHT) {
                    axes[i].screenx = axes[i].x - hOff;
                    axes[i].screeny = axes[i].y - vOff;

                    shadowOAM[12].attr0 = ATTR0_SQUARE | ATTR0_Y(axes[i].screeny);
                    shadowOAM[12].attr1 = ATTR1_TINY | ATTR1_X(axes[i].screenx);
                    shadowOAM[12].attr2 = ATTR2_TILEID(0, 7);
            }

        } else {
            // not active
            shadowOAM[12].attr0 = ATTR0_HIDE;
        }
    }

}*/

/*void playerAttack() {
    for (int i = 0; i < AXCOUNT; i++) {
        if (!axes[i].active) {
            axes[i].active = 1;
            axes[i].x = player.x + player.width / 2;
            axes[i].y = player.y + player.height / 2;

            if (player.direction == RIGHT) {
                axes[i].direction = RIGHT;
            } else if (player.direction == LEFT) {
                axes[i].direction = LEFT;
            }

            break; 
        }
    }
} */

void initAxe() {
    axe.x = 0;
    axe.y = 0;
    axe.width = 8;
    axe.height = 8;
    axe.xVel = 3;
    axe.yVel = 1;
    axe.active = 0;
    axe.numFrames = 4;
    axe.timeUntilNextFrame = 8;
    axe.currentFrame = 0;
    axe.collected = 0;
    
    axe.returning = 0;

}

void updateAxe() {

    if (axe.active && axe.collected) {


        if (axe.direction == LEFT) {
            axe.x -= axe.xVel;
        } else {
            axe.x += axe.xVel;
        }

        if (!axe.returning) {  
            if (axe.y > axe.startingY - 15) {
                axe.y -= axe.yVel;  
            } else {
                axe.returning = 1;  
            }
        }
        if (axe.returning) {
            axe.y += axe.yVel;  
        }


        if (!colorAt(axe.x, axe.y + axe.height + axe.yVel) || !colorAt(axe.x + axe.width, axe.y + axe.height + axe.yVel)) {
            axe.active = 0;
        }


        if (axe.x < hOff || axe.x > hOff + SCREENWIDTH) {
            axe.active = 0; 
        }

        if (axe.x < 0 || axe.x > MAPWIDTH - axe.width) {
            axe.active = 0; 
        }

        if (axe.y > MAPHEIGHT - axe.height) {
            axe.active = 0; 
        }

        if (--axe.timeUntilNextFrame == 0) {
            axe.currentFrame = (axe.currentFrame + 1) % axe.numFrames;
            axe.timeUntilNextFrame = 8;
        }
    }


    axe.screenx = axe.x;
    axe.screeny = axe.y;

}

void drawAxe() {
    if (axe.active) {
        if (axe.x + axe.width > hOff && axe.x < hOff + SCREENWIDTH && 
            axe.y + axe.height > vOff && axe.y < vOff + SCREENHEIGHT) {

            axe.screenx = axe.x - hOff;
            axe.screeny = axe.y - vOff;

            shadowOAM[12].attr0 = ATTR0_SQUARE | ATTR0_Y(axe.screeny);
            shadowOAM[12].attr1 = ATTR1_TINY | ATTR1_X(axe.screenx);
            shadowOAM[12].attr2 = ATTR2_TILEID(axe.currentFrame, 7);
        } else {
            
            shadowOAM[12].attr0 = ATTR0_HIDE;
        }
    } else {
    
        shadowOAM[12].attr0 = ATTR0_HIDE;
    }
}

int checkMonster() {

    ////////////////////////////////////////
    // axe collies w/ monster
    ////////////////////////////////////////

    if (collision(monster.x, monster.y, monster.width, monster.height, axe.x, axe.y, axe.width, axe.height)) {
        return 1;
    } else {
        return -1;
    }

}

void initPower() {

    // place power 1, 2, 3, 4, 5

    // power 1
    power1.x = 3;
    power1.y = 343;
    power1.width = 8;
    power1.height = 8;
    power1.active = 1;
    power1.timePassed = 15;

    // power2
    power2.x = 80;
    power2.y = 184;
    power2.width = 8;
    power2.height = 8;
    power2.active = 1;
    power2.timePassed = 15;

    // power3
    power3.x = 160;
    power3.y = 112;
    power3.width = 8;
    power3.height = 8;
    power3.active = 1;
    power3.timePassed = 15;

    // power 4
    power4.x = 114;
    power4.y = 144;
    power4.width = 8;
    power4.height = 8;
    power4.active = 1;
    power4.timePassed = 15;

    // power 5
    power5.x = 232;
    power5.y = 296;
    power5.width = 8;
    power5.height = 8;
    power5.active = 1;
    power5.timePassed = 15;

}

void updatePower() {

    if (power1.active) {
        power1.timePassed--;
        if (power1.timePassed == 0) {

             // collision w/ power 1 
            if (power1.active && collision(player.x, player.y, player.width, player.height, power1.x, power1.y, power1.width, power1.height)) {
                energy++;
                power1.active = 0;
            }

            power1.timePassed = 15;
        }
    }
    
    if (power2.active) {
        power2.timePassed--;
        if (power2.timePassed == 0) {

             // collision w/ power 2
            if (power2.active && collision(player.x, player.y, player.width, player.height, power2.x, power2.y, power2.width, power2.height)) {
                energy++;
                power2.active = 0;
            }

            power2.timePassed = 15;
        }
    }

    if (power3.active) {
        power3.timePassed--;
        if (power3.timePassed == 0) {

             // collision w/ power 3 
            if (power3.active && collision(player.x, player.y, player.width, player.height, power3.x, power3.y, power3.width, power3.height)) {
                energy++;
                power3.active = 0;
            }

            power3.timePassed = 15;
        }
    }

    if (power4.active) {
        power4.timePassed--;
        if (power4.timePassed == 0) {

             // collision w/ power 4 
            if (power4.active && collision(player.x, player.y, player.width, player.height, power4.x, power4.y, power4.width, power4.height)) {
                energy++;
                power4.active = 0;
            }

            power4.timePassed = 15;
        }
    }

    if (power5.active) {
        power5.timePassed--;
        if (power5.timePassed == 0) {

             // collision w/ power 5 
            if (power5.active && collision(player.x, player.y, player.width, player.height, power5.x, power5.y, power5.width, power5.height)) {
                energy++;
                power5.active = 0;
            }

            power5.timePassed = 15;
        }
    }


   /* // collision w/ power 1
    if (power1.active && collision(player.x, player.y, player.width, player.height, power1.x, power1.y, power1.width, power1.height)) {
        energy++;
        power1.active = 0;
    }

    // collision w/ power 2
    if (power2.active && collision(player.x, player.y, player.width, player.height, power2.x, power2.y, power2.width, power2.height)) {
        energy++;
        power2.active = 0;
    }

    // collision w/ power 3
    if (power3.active && collision(player.x, player.y, player.width, player.height, power3.x, power3.y, power3.width, power3.height)) {
        energy++;
        power3.active = 0;
    }

    // collision w/ power 4
    if (power4.active && collision(player.x, player.y, player.width, player.height, power4.x, power4.y, power4.width, power4.height)) {
        energy++;
        power4.active = 0;
    }

    // collision w/ power 5
    if (power5.active && collision(player.x, player.y, player.width, player.height, power5.x, power5.y, power5.width, power5.height)) {
        energy++;
        power5.active = 0;
    }
    */

}

void drawPower() {

    // starts from oam 43

    // power1
    if (power1.active) {

        if (power1.x + power1.width >= hOff && power1.x <= hOff + SCREENWIDTH &&
            power1.y + power1.height >= vOff && power1.y <= vOff + SCREENWIDTH) {

            power1.screenx = power1.x - hOff;
            power1.screeny = power1.y - vOff;

            shadowOAM[43].attr0 = ATTR0_SQUARE | ATTR0_Y(power1.screeny);
            shadowOAM[43].attr1 = ATTR1_TINY | ATTR1_X(power1.screenx);
            shadowOAM[43].attr2 = ATTR2_TILEID(0, 11);

        }

    } else {

        shadowOAM[43].attr0 = ATTR0_HIDE;
    }

    // power2
    if (power2.active) {

        if (power2.x + power2.width >= hOff && power2.x <= hOff + SCREENWIDTH &&
            power2.y + power2.height >= vOff && power2.y <= vOff + SCREENWIDTH) {

            power2.screenx = power2.x - hOff;
            power2.screeny = power2.y - vOff;

            shadowOAM[44].attr0 = ATTR0_SQUARE | ATTR0_Y(power2.screeny);
            shadowOAM[44].attr1 = ATTR1_TINY | ATTR1_X(power2.screenx);
            shadowOAM[44].attr2 = ATTR2_TILEID(0, 11);

        }

    } else {

        shadowOAM[44].attr0 = ATTR0_HIDE;
    }

    // power3
    if (power3.active) {

        if (power3.x + power3.width >= hOff && power3.x <= hOff + SCREENWIDTH &&
            power3.y + power3.height >= vOff && power3.y <= vOff + SCREENWIDTH) {

            power3.screenx = power3.x - hOff;
            power3.screeny = power3.y - vOff;

            shadowOAM[45].attr0 = ATTR0_SQUARE | ATTR0_Y(power3.screeny);
            shadowOAM[45].attr1 = ATTR1_TINY | ATTR1_X(power3.screenx);
            shadowOAM[45].attr2 = ATTR2_TILEID(0, 11);

        }

    } else {

        shadowOAM[45].attr0 = ATTR0_HIDE;
    }

    // power4
    if (power4.active) {

        if (power4.x + power4.width >= hOff && power4.x <= hOff + SCREENWIDTH &&
            power4.y + power4.height >= vOff && power4.y <= vOff + SCREENWIDTH) {

            power4.screenx = power4.x - hOff;
            power4.screeny = power4.y - vOff;

            shadowOAM[46].attr0 = ATTR0_SQUARE | ATTR0_Y(power4.screeny);
            shadowOAM[46].attr1 = ATTR1_TINY | ATTR1_X(power4.screenx);
            shadowOAM[46].attr2 = ATTR2_TILEID(0, 11);

        }

    } else {

        shadowOAM[46].attr0 = ATTR0_HIDE;
    }

    // power5
    if (power5.active) {

        if (power5.x + power5.width >= hOff && power5.x <= hOff + SCREENWIDTH &&
            power5.y + power5.height >= vOff && power5.y <= vOff + SCREENWIDTH) {

            power5.screenx = power5.x - hOff;
            power5.screeny = power5.y - vOff;

            shadowOAM[42].attr0 = ATTR0_SQUARE | ATTR0_Y(power5.screeny);
            shadowOAM[42].attr1 = ATTR1_TINY | ATTR1_X(power5.screenx);
            shadowOAM[42].attr2 = ATTR2_TILEID(0, 11);

        }

    } else {

        shadowOAM[42].attr0 = ATTR0_HIDE;
    }



}

void drawMonsterHealth() {
    if (player.y <= 40) {

        int numEmpty = 3 - monster.health;

        // draw heart
        shadowOAM[19].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
        shadowOAM[19].attr1 = ATTR1_TINY | ATTR1_X(140);
        shadowOAM[19].attr2 = ATTR2_TILEID(9, 10);

        for (int i = 0; i < monster.health; i++) {
            shadowOAM[i+20].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
            shadowOAM[i+20].attr1 = ATTR1_TINY | ATTR1_X(148 + (8 * i));
            shadowOAM[i+20].attr2 = ATTR2_TILEID(11, 10);

        }

        for (int i = 0; i < numEmpty; i++) {
            shadowOAM[monster.health + 21 + i].attr0 = ATTR0_SQUARE | ATTR0_Y(0);
            shadowOAM[monster.health + 21 + i].attr1 = ATTR1_TINY | ATTR1_X(148 + 8 * (monster.health + i));
            shadowOAM[monster.health + 21 + i].attr2 = ATTR2_TILEID(10, 10);
        }

    }
}

void turnOnCheat() {

    cheat = 1;
    player.health = 5;
    energy = 5;

}