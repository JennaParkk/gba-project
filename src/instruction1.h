
//{{BLOCK(instruction1)

//======================================================================
//
//	instruction1, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 295 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9440 + 2048 = 12000
//
//	Time-stamp: 2024-05-01, 02:50:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTION1_H
#define GRIT_INSTRUCTION1_H

#define instruction1TilesLen 9440
extern const unsigned short instruction1Tiles[4720];

#define instruction1MapLen 2048
extern const unsigned short instruction1Map[1024];

#define instruction1PalLen 512
extern const unsigned short instruction1Pal[256];

#endif // GRIT_INSTRUCTION1_H

//}}BLOCK(instruction1)
