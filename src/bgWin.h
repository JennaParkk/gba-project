
//{{BLOCK(bgWin)

//======================================================================
//
//	bgWin, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 62 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1984 + 2048 = 4544
//
//	Time-stamp: 2024-04-29, 04:06:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGWIN_H
#define GRIT_BGWIN_H

#define bgWinTilesLen 1984
extern const unsigned short bgWinTiles[992];

#define bgWinMapLen 2048
extern const unsigned short bgWinMap[1024];

#define bgWinPalLen 512
extern const unsigned short bgWinPal[256];

#endif // GRIT_BGWIN_H

//}}BLOCK(bgWin)
