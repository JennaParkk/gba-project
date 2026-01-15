# GBA Game Development - Copilot Instructions

## Project Overview
This is a **Game Boy Advance (GBA)** action game featuring a player character collecting items while avoiding enemies and obstacles. The game includes multiple screens (start, instructions, gameplay, pause, win/lose states) and sprite-based rendering with background tiling.

## Build & Deployment

### Build Pipeline
- **Compiler**: arm-none-eabi-gcc (via Docker container `aaaronic/gba-compiler:1.2`)
- **Build Command**: `docker run --rm -it -v "${PWD}:/gba" aaaronic/gba-compiler:1.2`
- **Output**: `Project.gba` (executable ROM file)
- **Run**: Opens emulator with: `open /Users/jennapark/Desktop/mGBA_project/mGBA.app ./Project.gba`

Build process includes audio conversion (.wav → .c/.h files) and cleanup via `make clean` (removes .o, .i, .s, .sav files).

## Architecture & Key Components

### State Machine (main.c)
Game uses enum-based state management with 6 states:
- `START`: Title screen
- `INSTRUCTION`: Tutorial/rules
- `GAME`: Active gameplay
- `PAUSE`: Pause overlay
- `WIN`/`LOSE`: End screens

Main loop (406 lines) handles state switching via `switch(state)` and runs DMA transfer each VBlank: `DMANow(3, shadowOAM, OAM, 512)`.

### Core Data Structures (game.h)

**SPRITE_CUSTOM** - Dynamic game entities (player, monster)
```c
struct {
  int x, y, xVel, yVel, width, height;
  int health, currentFrame, numFrames;
  u8 oamIndex;  // Index in shadowOAM (max 128 sprites)
  int screenx, screeny;  // Viewport-relative coordinates
};
```

**BOX** - Collectible items (energy, weapon, shield)
**ENEMY** - Hostile entities with movement
**AXE** - Throwable weapon (max 5 active: `#define AXCOUNT 5`)
**SPIKE** - Static obstacles

### Viewport System
- **Map dimensions**: 256×512 pixels (game.h: `MAPWIDTH`, `MAPHEIGHT`)
- **Screen dimensions**: 240×160 (GBA standard, from gba.h)
- **Offset tracking**: `hOff`, `vOff` globals in main.c control viewport
- **Screen-relative coords**: All sprites compute `screenx = x - hOff; screeny = y - vOff`

## Graphics Pipeline

### Video Mode
Uses **Mode 0** (tiled backgrounds + sprites):
- 4 text-based backgrounds (BG0-BG3) via mode0.h
- Sprite layer (up to 128 OBJ_ATTR entries in shadowOAM)
- Display control: `REG_DISPCTL = MODE(0) | BG0_ENABLE | ... | SPRITE_ENABLE`

### Tile & Sprite Setup
- **Character Blocks (CHARBLOCK)**: Tileset storage at 0x06000000
- **Screen Blocks (SCREENBLOCK)**: Tile maps for each BG
- **Sprite Palette**: 256-color palette at 0x5000200
- **OAM (Object Attribute Memory)**: shadowOAM (CPU) → OAM (GPU) via DMA each frame

### Asset Files Pattern
Each visual asset has 4 generated files:
```
assetName.c    // Tile/palette data (auto-compiled)
assetName.h    // Header with extern declarations
assetName.i    // Intermediate (generated, not edited)
assetName.s    // Assembly (generated, not edited)
```
Examples: `bgStart.{c,h,i,s}`, `spritesheet2.{c,h,i,s}`

## Collision & Game Logic

### Collision Detection
- Utility: `collision(x1, y1, w1, h1, x2, y2, w2, h2)` in gba.h
- Player collides with: enemies, boxes, spikes, fire projectiles
- Example: `collidesWithBox()` in game.h checks player vs all active boxes

### Input Handling (gba.h Macros)
```c
#define BUTTON_HELD(key)    (~(REG_BUTTONS) & (key))       // Current frame
#define BUTTON_PRESSED(key) (!(~(oldButtons) & (key)) && (~REG_BUTTONS & (key)))  // Edge-triggered
```
Main loop updates `oldButtons = buttons; buttons = REG_BUTTONS;` each frame.

## Game Loop Pattern (Critical Pattern)

All game phases follow this pattern in main.c:
```c
void goToSTATE() {  // Init state
  initGame();
  // setup...
  state = GAME;
}

void STATE() {  // Main loop for this state
  updateGame();
  drawGame();
}
```

Apply this when adding new game screens.

## Key Files by Responsibility

| File | Purpose |
|------|---------|
| main.c | State machine, VBlank sync, DMA, input polling |
| game.c/h | Player, monsters, enemies, items, collision logic |
| sprites.h | OAM attribute macros, sprite rendering API |
| mode0.h | Background tile registers and tilemap functions |
| gba.h | Hardware registers, core utilities (collision, DMA) |
| print.h | Text rendering (for UI) |
| sound.h/gameTrack1.h | Audio playback |

## Critical Constraints & Gotchas

1. **OAM Limit**: Max 128 sprites (shadowOAM array). Excess sprites must be hidden with `ATTR0_HIDE`.
2. **DMA Timing**: OAM transfer MUST occur during VBlank (`waitForVBlank()` first).
3. **Viewport Math**: Always compute screen coords before drawing: `screenx = x - hOff`.
4. **Frame Rate**: Locked to ~60 FPS (VBlank sync); avoid busy-waiting outside VBlank.
5. **Memory**: GBA has only 32KB EWRAM; minimize dynamic allocations (use fixed-size arrays).
6. **Audio Conversion**: .wav files auto-converted by Makefile; header files must be included before use.

## Code Style & Conventions

- **Globals for state**: `int state`, `unsigned short buttons`, `int hOff/vOff` (main.c)
- **Entity naming**: `player`, `monster` (SPRITE_CUSTOM), `enemies[]` array
- **Init/Update/Draw**: All game systems follow 3-phase pattern: `initX()`, `updateX()`, `drawX()`
- **Comments**: Hardware register definitions include inline bit documentation (see gba.h, sprites.h)
