
#ifndef TENTITY_H__
#define TENTITY_H__

#include <cpctelera.h>

struct TPosition {
  u8 x, y;
};

struct TPhysics {
  i8 vx, vy;
};

struct TRender {
  u8 w, h, sprite;
};

struct TEntity {
  struct TPosition pos;
  struct TPosition prev;
  struct TPhysics phys;
  struct TRender ren;
  u8 energy;
  u8 attack;
  u8 deffense;
  u8 force;
};

#endif
