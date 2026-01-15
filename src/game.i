# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 6 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 36 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 37 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3



# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 63 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 113 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef __int_least64_t time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_pthreadtypes.h" 1 3
# 240 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 241 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 62 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 80 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 186 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int fscanf (FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int printf (const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 1, 2)));
int scanf (const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 1, 2)));
int sscanf (const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int vprintf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 1, 0)));
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void *restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int remove (const char *);
int rename (const char *, const char *);
# 266 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int vscanf (const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 1, 0)));
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
# 396 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _diprintf_r (struct _reent *, int, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _dprintf_r (struct _reent *, int, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fiscanf_r (struct _reent *, FILE *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void *restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void *restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _iscanf_r (struct _reent *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 2, 3)));
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *,
      const char *_old, const char *_new);
int _scanf_r (struct _reent *, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 2, 3)));
int _siprintf_r (struct _reent *, char *, const char *, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _siscanf_r (struct _reent *, const char *, const char *, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 4, 5)));
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__printf__, 3, 4)));
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...)
               __attribute__ ((__format__ (__scanf__, 3, 4)));
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 2, 0)));
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 2, 0)));
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 4, 0)));
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__printf__, 3, 0)));
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list)
               __attribute__ ((__format__ (__scanf__, 3, 0)));



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 577 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 687 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 741 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3
static __inline int
_getchar_unlocked(void)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return ((--(((_ptr)->_stdin))->_r < 0 ? __srget_r(_ptr, ((_ptr)->_stdin)) : (int)(*(((_ptr)->_stdin))->_p++)));
}

static __inline int
_putchar_unlocked(int _c)
{
 struct _reent *_ptr;

 _ptr = (__getreent());
 return (__sputc_r(_ptr, _c, ((_ptr)->_stdout)));
}
# 797 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdio.h" 3

# 7 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"

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
# 8 "game.c" 2

# 1 "collisionmap2.h" 1
# 21 "collisionmap2.h"
extern const unsigned short collisionmap2Bitmap[65536];


extern const unsigned short collisionmap2Pal[256];
# 10 "game.c" 2
# 1 "forEva.h" 1
# 21 "forEva.h"
extern const unsigned short forEvaTiles[4096];


extern const unsigned short forEvaPal[256];
# 11 "game.c" 2
# 1 "practice.h" 1







extern const unsigned short practiceMap[4096];
# 12 "game.c" 2
# 1 "practiceFinal.h" 1







extern const unsigned short practiceFinalMap[2048];
# 13 "game.c" 2
# 1 "spritesheet2.h" 1
# 21 "spritesheet2.h"
extern const unsigned short spritesheet2Tiles[16384];


extern const unsigned short spritesheet2Pal[16];
# 14 "game.c" 2




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
    return ptr[((y) * (256) + (x))];

}

void initGame() {

    DMANow(3, forEvaTiles, &((CB*) 0x06000000)[0], 8192/2);



    DMANow(3, forEvaPal, ((unsigned short*) 0x05000000), 512 / 2);

    DMANow(3, practiceFinalMap, &((SB*) 0x06000000)[28], (4096)/2);


    DMANow(3, spritesheet2Tiles, &((CB*) 0x06000000)[4], 32768/2);
    DMANow(3, spritesheet2Pal, ((u16*) 0x5000200), 256);


    (*(volatile unsigned short*) 0x04000000) = (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (2 << 14) | (1 << 12);




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



    if (!collidesWithLadder() && (player.y + player.height < 512)) {

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


    if ((~((*(volatile unsigned short*) 0x04000130)) & ((1 << 4)))) {
        player.direction = RIGHT;
        player.isAnimating = 1;

        if (player.x < 256 - player.width && colorAt(rightX + player.xVel, topY)
         && colorAt(rightX + player.xVel, bottomY)) {
            player.x += player.xVel;
        }
    }


    if ((~((*(volatile unsigned short*) 0x04000130)) & ((1 << 5)))) {
        player.direction = LEFT;
        player.isAnimating = 1;

        if (player.x >= 0 && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
            player.x -= player.xVel;
        }

    }




    if ((~((*(volatile unsigned short*) 0x04000130)) & ((1 << 7)))) {
        player.direction = DOWN;
        player.isAnimating = 1;

        if (player.y + player.height < 512 && colorAt(leftX, bottomY + player.yVel) &&
            colorAt(rightX, bottomY + player.yVel) && collidesWithLadder()) {
                player.y += player.yVel;
            }
    }


    if ((~((*(volatile unsigned short*) 0x04000130)) & ((1 << 6)))) {

        player.direction = UP;
        player.isAnimating = 1;

        if (player.y >= 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel) && collidesWithLadder()) {
            player.y -= player.yVel;
        }
    }




    hOff = player.x - (240 - player.width) / 2;
    vOff = player.y - (160 - player.height) / 2;



    if ((~((*(volatile unsigned short*) 0x04000130)) & ((1 << 1)))) {

        if (!collidesWithLadder() && player.y >= 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel)) {

                player.y -= 7;

            }
    }




    if (enemy1.active && !cheat) {
        if (collision(player.x, player.y, player.width, player.height, enemy1.x, enemy1.y, enemy1.width, enemy1.height)) {
            enemy1.active = 0;
            player.health--;
        }
    }


    if (enemy2.active && !cheat) {
        if (collision(player.x, player.y, player.width, player.height, enemy2.x, enemy2.y, enemy2.width, enemy2.height)) {
            enemy2.active = 0;
            player.health--;
        }
    }






    int boxNumber = collidesWithBox();


    if (boxNumber == 1 && box1.active) {
        playerSprite = 8;
        axe.collected = 1;
    }






    if (boxNumber != -1) {
        updateBoxes(boxNumber);
    }






    updatePower();
    if (energy == 5) {
        player.health++;
    }




    if ((!(~(oldButtons) & ((1 << 0))) && (~(*(volatile unsigned short*) 0x04000130) & ((1 << 0)))) && !axe.active && axe.collected) {
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


    if (vOff + 160 >= 512) {
        vOff = 512 - 160;
    }

    if (vOff < 0 ) {
        vOff = 0;
    }

    if (hOff + 240 >= 256) {
        hOff = 256 - 240;
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
        if (player.x > monster.x && (monster.x + monster.width <= 240 - 40)) {
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



    if (monster.damageTimer == 0 && checkMonster() == 1) {
        monster.health--;
        monster.damageTimer = monster.timePassed;
    }
# 423 "game.c"
    int fire_leftX = fire.x;
    int fire_rightX = fire.x + fire.width - 1 ;
    int fire_topY = fire.y;
    int fire_bottomY = fire.y + fire.height - 1;

    updateFire();

}

void updateFire() {

    if (fire.active) {

        if (fire.direction == LEFT) {
            fire.x -= fire.xVel;
        } else {
            fire.x += fire.xVel;
        }


        if (collision(fire.x, fire.y, fire.width, fire.height, player.x, player.y, player.width, player.height)) {
            fire.active = 0;
            player.health--;
        }


        if (fire.x < 0 || fire.x > 256 - fire.width) {
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

    DMANow(3, forEvaTiles, &((CB*) 0x06000000)[0], 8192/2);



    DMANow(3, forEvaPal, ((unsigned short*) 0x05000000), 512 / 2);

    DMANow(3, practiceFinalMap, &((SB*) 0x06000000)[28], (4096)/2);


    DMANow(3, spritesheet2Tiles, &((CB*) 0x06000000)[4], 32768/2);
    DMANow(3, spritesheet2Pal, ((u16*) 0x5000200), 256);

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

    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128*4);



}

void drawCastle() {

    int castleX = 215;
    int castleY = 8;




    if (castleX + 32 >= hOff && castleX <= hOff + 240 &&
        castleY + 32 >= vOff && castleY <= vOff + 160) {

        int castleScreenx = castleX - hOff;
        int castleScreeny = castleY - vOff;

        shadowOAM[15].attr0 = (0 << 14) | ((castleScreeny) & 0xFF);
        shadowOAM[15].attr1 = (2 << 14) | ((castleScreenx) & 0x1FF);
        shadowOAM[15].attr2 = (((9) * (32) + (4)) & 0x3FF);

    }

}

void drawPlayer() {

    if (player.x < 240) {
        player.screenx = player.x - hOff;
    }

    if (player.x > 240) {
        player.screenx = player.x - hOff;
    }

    if (player.y < 160) {
        player.screeny = player.y - vOff;
    }

    if (player.y > 160) {
        player.screeny = player.y - vOff;
    }



    shadowOAM[13].attr0 = (0 << 14) | ((player.screeny) & 0xFF);
    shadowOAM[13].attr1 = (1 << 14) | ((player.screenx) & 0x1FF);
    shadowOAM[13].attr2 = (((player.currentFrame * 2) * (32) + ((player.direction * 2) + playerSprite)) & 0x3FF);


}

void drawMonster() {

    if (monster.health != 0) {

        monster.timeUntilNextFrame--;

        if (monster.timeUntilNextFrame == 0) {
            monster.currentFrame = (monster.currentFrame + 1) % monster.numFrames;
            monster.timeUntilNextFrame = 10;
        }

        if (monster.x + monster.width >= hOff && monster.x <= hOff + 240 &&
            monster.y + monster.height >= vOff && monster.y <= vOff + 160) {

            monster.screenx = monster.x - hOff;
            monster.screeny = monster.y - vOff;

            shadowOAM[14].attr0 = (0 << 14) | ((monster.screeny) & 0xFF);

            if (monster.direction == RIGHT) {
                    shadowOAM[14].attr1 = (1 << 14) | ((monster.screenx) & 0x1FF);
                } else {
                    shadowOAM[14].attr1 = (1 << 14) | ((monster.screenx) & 0x1FF) | (1 << 12);
                }


            shadowOAM[14].attr2 = (((6) * (32) + (8 + (monster.currentFrame * 2))) & 0x3FF);

        }

    }

    if (fire.active) {
        if (--fire.timeUntilNextFrame == 0) {
            fire.currentFrame = (fire.currentFrame + 1) % fire.numFrames;
            fire.timeUntilNextFrame = 15;
        }

        if (fire.x + fire.width >= hOff && fire.x <= hOff + 240 &&
            fire.y + fire.height >= vOff && fire.y <= vOff + 160) {

            fire.screenx = fire.x - hOff;
            fire.screeny = fire.y - vOff;

            shadowOAM[17].attr0 = (1 << 14) | ((fire.screeny) & 0xFF);

            if (fire.direction == RIGHT) {
                    shadowOAM[17].attr1 = (0 << 14) | ((fire.screenx) & 0x1FF);
                } else {
                    shadowOAM[17].attr1 = (0 << 14) | ((fire.screenx) & 0x1FF) | (1 << 12);
                }


            shadowOAM[17].attr2 = (((8) * (32) + (8 + (fire.currentFrame * 2))) & 0x3FF);

        }
    }






}

void drawHealth() {

    if (player.health > 5) {
        player.health = 5;
    }

    int numEmpty = 5 - player.health;


    shadowOAM[0].attr0 = (0 << 14) | ((0) & 0xFF);
    shadowOAM[0].attr1 = (0 << 14) | ((0) & 0x1FF);
    shadowOAM[0].attr2 = (((10) * (32) + (0)) & 0x3FF);

    for (int i = 0; i < player.health; i++) {
        shadowOAM[i+1].attr0 = (0 << 14) | ((0) & 0xFF);
        shadowOAM[i+1].attr1 = (0 << 14) | ((8 + (8 * i)) & 0x1FF);
        shadowOAM[i+1].attr2 = (((10) * (32) + (2)) & 0x3FF);

    }

    for (int i = 0; i < numEmpty; i++) {
        shadowOAM[player.health + 1 + i].attr0 = (0 << 14) | ((0) & 0xFF);
        shadowOAM[player.health + 1 + i].attr1 = (0 << 14) | ((8 * (player.health + 1 + i)) & 0x1FF);
        shadowOAM[player.health + 1 + i].attr2 = (((10) * (32) + (1)) & 0x3FF);
    }
}

int collidesWithLadder() {
# 660 "game.c"
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


    box1.x = 176;
    box1.y = 439;
    box1.width = 16;
    box1.height = 16;
    box1.active = 1;
    box1.erased = 0;
    box1.item = WEAPON;
# 692 "game.c"
}

void updateBoxes(int boxNum) {


    if (boxNum == 1 && box1.active == 1) {
        box1.active = 0;
    }







}

void drawBoxes() {


    if (box1.active) {

        if (box1.x + box1.width >= hOff && box1.x <= hOff + 240 &&
            box1.y + box1.height >= vOff && box1.y <= vOff + 160) {

                box1.screenx = box1.x - hOff;
                box1.screeny = box1.y - vOff;

                shadowOAM[40].attr0 = (0 << 14) | ((box1.screeny) & 0xFF);
                shadowOAM[40].attr1 = (1 << 14) | ((box1.screenx) & 0x1FF);
                shadowOAM[40].attr2 = (((8) * (32) + (0)) & 0x3FF);

            }

    } else {
        shadowOAM[40].attr0 = (2 << 8);
    }
# 748 "game.c"
}





int collidesWithBox() {




    if (collision(player.x, player.y, player.width, player.height, box1.x, box1.y, box1.width, box1.height)) {

        return 1;

    } else if (collision(player.x, player.y, player.width, player.height, box2.x, box2.y, box2.width, box2.height)) {

        return 2;
    } else if (collision(player.x, player.y, player.width, player.height, box3.x, box3.y, box3.width, box3.height)) {

        return 3;
    } else {

        return -1;
    }

}

void drawEnergy() {

    if (energy > 5) {
        energy = 5;
    }


    int numEmpty = 5 - energy;


    shadowOAM[6].attr0 = (0 << 14) | ((8) & 0xFF);
    shadowOAM[6].attr1 = (0 << 14) | ((0) & 0x1FF);
    shadowOAM[6].attr2 = (((11) * (32) + (0)) & 0x3FF);

    for (int i = 0; i < numEmpty; i++) {
        shadowOAM[energy + 7 + i].attr0 = (0 << 14) | ((8) & 0xFF);
        shadowOAM[energy + 7 + i].attr1 = (0 << 14) | ((8 * (energy + 1 + i)) & 0x1FF);
        shadowOAM[energy + 7 + i].attr2 = (((11) * (32) + (1)) & 0x3FF);
    }

    for (int i = 0; i < energy; i++) {
        shadowOAM[i+7].attr0 = (0 << 14) | ((8) & 0xFF);
        shadowOAM[i+7].attr1 = (0 << 14) | ((8 + (8 * i)) & 0x1FF);
        shadowOAM[i+7].attr2 = (((11) * (32) + (2)) & 0x3FF);

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




    }



}

void drawEnemies() {

    if (enemy1.active) {
        enemy1.timeUntilNextFrame--;
        if (enemy1.timeUntilNextFrame == 0) {
            enemy1.currentFrame = (enemy1.currentFrame + 1) % enemy1.numFrames;
            enemy1.timeUntilNextFrame = 10;
        }
        if (enemy1.x + enemy1.width >= hOff && enemy1.x <= hOff + 240 &&
            enemy1.y + enemy1.height >= vOff && enemy1.y <= vOff + 160) {
                enemy1.screenx = enemy1.x - hOff;
                enemy1.screeny = enemy1.y - vOff;

                shadowOAM[41].attr0 = (0 << 14) | ((enemy1.screeny) & 0xFF);

                if (enemy1.direction == RIGHT) {
                    shadowOAM[41].attr1 = (0 << 14) | ((enemy1.screenx) & 0x1FF);
                } else {
                    shadowOAM[41].attr1 = (0 << 14) | ((enemy1.screenx) & 0x1FF) | (1 << 12);
                }

                shadowOAM[41].attr2 = (((6) * (32) + (4 + enemy1.currentFrame)) & 0x3FF);
            }


    } else {

        shadowOAM[41].attr0 = (2 << 8);

    }



    if (enemy2.active) {
        enemy2.timeUntilNextFrame--;
        if (enemy2.timeUntilNextFrame == 0) {
            enemy2.currentFrame = (enemy2.currentFrame + 1) % enemy2.numFrames;
            enemy2.timeUntilNextFrame = 10;
        }
        if (enemy2.x + enemy2.width >= hOff && enemy2.x <= hOff + 240 &&
            enemy2.y + enemy2.height >= vOff && enemy2.y <= vOff + 160) {
                enemy2.screenx = enemy2.x - hOff;
                enemy2.screeny = enemy2.y - vOff;

                shadowOAM[18].attr0 = (0 << 14) | ((enemy2.screeny) & 0xFF);

                if (enemy2.direction == RIGHT) {
                    shadowOAM[18].attr1 = (0 << 14) | ((enemy2.screenx) & 0x1FF);
                } else {
                    shadowOAM[18].attr1 = (0 << 14) | ((enemy2.screenx) & 0x1FF) | (1 << 12);
                }

                shadowOAM[18].attr2 = (((6) * (32) + (6 + enemy2.currentFrame)) & 0x3FF);
            }


    } else {

        shadowOAM[18].attr0 = (2 << 8);

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


    spike5.x = 148;
    spike5.y = 298;
    spike5.width = 12;
    spike5.height = 8;


    spike6.x = 196;
    spike6.y = 265;
    spike6.width = 24;
    spike6.height = 16;


    spike7.x = 173;
    spike7.y = 128;
    spike7.width = 9;
    spike7.height = 8;


    spike8.x = 154;
    spike8.y = 88;
    spike8.width = 14;
    spike8.height = 14;


    spike9.x = 168;
    spike9.y = 88;
    spike9.width = 12;
    spike9.height = 8;


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
# 1214 "game.c"
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


        if (axe.x < hOff || axe.x > hOff + 240) {
            axe.active = 0;
        }

        if (axe.x < 0 || axe.x > 256 - axe.width) {
            axe.active = 0;
        }

        if (axe.y > 512 - axe.height) {
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
        if (axe.x + axe.width > hOff && axe.x < hOff + 240 &&
            axe.y + axe.height > vOff && axe.y < vOff + 160) {

            axe.screenx = axe.x - hOff;
            axe.screeny = axe.y - vOff;

            shadowOAM[12].attr0 = (0 << 14) | ((axe.screeny) & 0xFF);
            shadowOAM[12].attr1 = (0 << 14) | ((axe.screenx) & 0x1FF);
            shadowOAM[12].attr2 = (((7) * (32) + (axe.currentFrame)) & 0x3FF);
        } else {

            shadowOAM[12].attr0 = (2 << 8);
        }
    } else {

        shadowOAM[12].attr0 = (2 << 8);
    }
}

int checkMonster() {





    if (collision(monster.x, monster.y, monster.width, monster.height, axe.x, axe.y, axe.width, axe.height)) {
        return 1;
    } else {
        return -1;
    }

}

void initPower() {




    power1.x = 3;
    power1.y = 343;
    power1.width = 8;
    power1.height = 8;
    power1.active = 1;
    power1.timePassed = 15;


    power2.x = 80;
    power2.y = 184;
    power2.width = 8;
    power2.height = 8;
    power2.active = 1;
    power2.timePassed = 15;


    power3.x = 160;
    power3.y = 112;
    power3.width = 8;
    power3.height = 8;
    power3.active = 1;
    power3.timePassed = 15;


    power4.x = 114;
    power4.y = 144;
    power4.width = 8;
    power4.height = 8;
    power4.active = 1;
    power4.timePassed = 15;


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


            if (power5.active && collision(player.x, player.y, player.width, player.height, power5.x, power5.y, power5.width, power5.height)) {
                energy++;
                power5.active = 0;
            }

            power5.timePassed = 15;
        }
    }
# 1468 "game.c"
}

void drawPower() {




    if (power1.active) {

        if (power1.x + power1.width >= hOff && power1.x <= hOff + 240 &&
            power1.y + power1.height >= vOff && power1.y <= vOff + 240) {

            power1.screenx = power1.x - hOff;
            power1.screeny = power1.y - vOff;

            shadowOAM[43].attr0 = (0 << 14) | ((power1.screeny) & 0xFF);
            shadowOAM[43].attr1 = (0 << 14) | ((power1.screenx) & 0x1FF);
            shadowOAM[43].attr2 = (((11) * (32) + (0)) & 0x3FF);

        }

    } else {

        shadowOAM[43].attr0 = (2 << 8);
    }


    if (power2.active) {

        if (power2.x + power2.width >= hOff && power2.x <= hOff + 240 &&
            power2.y + power2.height >= vOff && power2.y <= vOff + 240) {

            power2.screenx = power2.x - hOff;
            power2.screeny = power2.y - vOff;

            shadowOAM[44].attr0 = (0 << 14) | ((power2.screeny) & 0xFF);
            shadowOAM[44].attr1 = (0 << 14) | ((power2.screenx) & 0x1FF);
            shadowOAM[44].attr2 = (((11) * (32) + (0)) & 0x3FF);

        }

    } else {

        shadowOAM[44].attr0 = (2 << 8);
    }


    if (power3.active) {

        if (power3.x + power3.width >= hOff && power3.x <= hOff + 240 &&
            power3.y + power3.height >= vOff && power3.y <= vOff + 240) {

            power3.screenx = power3.x - hOff;
            power3.screeny = power3.y - vOff;

            shadowOAM[45].attr0 = (0 << 14) | ((power3.screeny) & 0xFF);
            shadowOAM[45].attr1 = (0 << 14) | ((power3.screenx) & 0x1FF);
            shadowOAM[45].attr2 = (((11) * (32) + (0)) & 0x3FF);

        }

    } else {

        shadowOAM[45].attr0 = (2 << 8);
    }


    if (power4.active) {

        if (power4.x + power4.width >= hOff && power4.x <= hOff + 240 &&
            power4.y + power4.height >= vOff && power4.y <= vOff + 240) {

            power4.screenx = power4.x - hOff;
            power4.screeny = power4.y - vOff;

            shadowOAM[46].attr0 = (0 << 14) | ((power4.screeny) & 0xFF);
            shadowOAM[46].attr1 = (0 << 14) | ((power4.screenx) & 0x1FF);
            shadowOAM[46].attr2 = (((11) * (32) + (0)) & 0x3FF);

        }

    } else {

        shadowOAM[46].attr0 = (2 << 8);
    }


    if (power5.active) {

        if (power5.x + power5.width >= hOff && power5.x <= hOff + 240 &&
            power5.y + power5.height >= vOff && power5.y <= vOff + 240) {

            power5.screenx = power5.x - hOff;
            power5.screeny = power5.y - vOff;

            shadowOAM[42].attr0 = (0 << 14) | ((power5.screeny) & 0xFF);
            shadowOAM[42].attr1 = (0 << 14) | ((power5.screenx) & 0x1FF);
            shadowOAM[42].attr2 = (((11) * (32) + (0)) & 0x3FF);

        }

    } else {

        shadowOAM[42].attr0 = (2 << 8);
    }



}

void drawMonsterHealth() {
    if (player.y <= 40) {

        int numEmpty = 3 - monster.health;


        shadowOAM[19].attr0 = (0 << 14) | ((0) & 0xFF);
        shadowOAM[19].attr1 = (0 << 14) | ((140) & 0x1FF);
        shadowOAM[19].attr2 = (((10) * (32) + (9)) & 0x3FF);

        for (int i = 0; i < monster.health; i++) {
            shadowOAM[i+20].attr0 = (0 << 14) | ((0) & 0xFF);
            shadowOAM[i+20].attr1 = (0 << 14) | ((148 + (8 * i)) & 0x1FF);
            shadowOAM[i+20].attr2 = (((10) * (32) + (11)) & 0x3FF);

        }

        for (int i = 0; i < numEmpty; i++) {
            shadowOAM[monster.health + 21 + i].attr0 = (0 << 14) | ((0) & 0xFF);
            shadowOAM[monster.health + 21 + i].attr1 = (0 << 14) | ((148 + 8 * (monster.health + i)) & 0x1FF);
            shadowOAM[monster.health + 21 + i].attr2 = (((10) * (32) + (10)) & 0x3FF);
        }

    }
}

void turnOnCheat() {

    cheat = 1;
    player.health = 5;
    energy = 5;

}
