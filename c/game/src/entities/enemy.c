
#include "enemy.h"

struct TEnemy enemy[3];

u8 enemies;
u8 x;
u8 e, a, d;
i8 const em[4] = {-1, 1, 1, -1};

void initEnemy(u8 e, u8 a, u8 d) {
   if (enemies < 3) {
      enemy[enemies].energy   = e;
      enemy[enemies].attack   = a;
      enemy[enemies].deffense = d;
      enemy[enemies].color = enemies + 1;
      enemy[enemies].x = 7 + (enemies * 2);
      enemy[enemies].sprite = 2;
      enemies++;
   }
}
