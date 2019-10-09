
#ifndef __ENEMY_H__
#define __ENEMY_H__
#include <cpctelera.h>

struct TEnemy {
  u8 energy;
  u8 attack;
  u8 deffense;
  u8 x;
  u8 force;
  u8 ei;
  u8 color;
  u8 sprite;
};

// Declare function
void initEnemy(u8 e, u8 a, u8 d);

extern struct TEnemy enemy[3];
extern u8 enemies;
extern u8 x;
extern u8 e, a, d;
extern i8 const em[4];

#endif
