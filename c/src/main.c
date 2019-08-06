/**
 * SUPER ULTRA RPG GAME
 * by @hec_linares
 * July 2019
 **/

#include <cpctelera.h>
#include <stdio.h>

struct TEnemy {
  u8 energy;
  u8 attack;
  u8 deffense;
  u8 x;
  u8 force;
};

struct TEnemy enemy[3];
u8 enemies;

void initEnemy(u8 e, u8 a, u8 d) {
   if (enemies < 3) {
      enemy[enemies].energy   = e;
      enemy[enemies].attack   = a;
      enemy[enemies].deffense = d;
      enemy[enemies].x = 7 + (enemies * 2);
      enemies++;
   }
}

void locate(u8 x, u8 y) {
   putchar(31);
   putchar(x);
   putchar(y);
}

void renderEnemy(u8 i) {
   locate(enemy[i].x, 6);
   putchar(224);
}

u8 FNr(u8 m) {
   return m-3+(cpct_rand()*7/255);
}

void renderString(u8 ch, u8 n) {
   while(n--) {
      putchar(ch);
   }
}

void initMode() {
   __asm
      call #0xBBFF
      call #0xBB4E
   __endasm;
}

void main(void) {
   // Init variables
   u8 e  = 100, a  = 30, d  = 15, x = 4, f = 0; 
   u8 ei = 0;
   i8 em[4] = {-1, 1, 1, -1};
   
   enemies = 0;
   
   // Init enemies
   initEnemy(40,  15, 5);
   initEnemy(80,  20, 10);
   initEnemy(100, 25, 15);
   
   // ASM power!
   initMode();
   
   // Let's start!
   puts("RPG GAME\r\n\r\nPRESS ENTER TO START");
   
   // Is enter pressed?
   while (!cpct_isKeyPressed(Key_Enter)) {
      cpct_scanKeyboard();
   }

   while (1) {

      // CLS
      putchar(12);
      
      // Print stats
      printf("PLAYER [%d] (a%d) (d%d)\r\n", e,   a,   d);
      printf("ENEMY  [%d] (a%d) (d%d)\r\n", enemy[0].energy, enemy[0].attack, enemy[0].deffense);
      
      // RENDER PLAYER
      locate(x, 6);
      putchar(250);
      
      // RENDER ENEMY
      for (u8 i = 0; i < enemies; i++) {
         renderEnemy(i);
      }
      
      // RENDER GROUND
      locate(1, 7);
      renderString(143, 20);
      locate(1, 8);
      renderString(216, 20);
      
      // Re scan keyboard
      do
         cpct_scanKeyboard();
      while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
         
      // PLAYER MOVES LEFT!
      if (cpct_isKeyPressed(Key_O)) {
         if(x > 1) x--;
      } else {
         // PLAYER MOVES RIGHT!
         if (cpct_isKeyPressed(Key_P)) {
            x++;
            // PLAYER ATTACKS!!
            if(x == enemy[0].x) {
               x--;
               locate(1,10);
               f = FNr(a);
               enemy[0].energy -= f;
               printf("PLAYER ATTACKS WITH FORCE: %d", f);
            }
         } else {
            // PLAYER DEFENDS!
            if (cpct_isKeyPressed(Key_D)) {
               f = FNr(d);
               e += f;
               locate(1,10);
               printf("PLAYER DEFENDS WITH FORCE: %d", f);
            }
         }
      }
      
      // ENEMY DECIDE
      if (enemy[0].x == x+1) {
         if (cpct_rand() < 64) {
            f = FNr(enemy[0].deffense);
            enemy[0].energy += f;
            locate(1,11);
            printf("ENEMY DEFENDS WITH FORCE: %d", f);
         } else {
            // ENEMY ATTACKS!
            f = FNr(enemy[0].attack);
            e -= f;
            locate(1,11);
            printf("ENEMY ATTACKS WITH FORCE: %d", f);
         }
      } else {
         // UPDATE ENEMY POSITION
         enemy[0].x += em[ei];
         ei++;
         if (ei > 3) ei = 0;
      }
      
      // Is enter pressed?
      while (!cpct_isKeyPressed(Key_Enter)) {
         cpct_scanKeyboard();
      }
   }
}
