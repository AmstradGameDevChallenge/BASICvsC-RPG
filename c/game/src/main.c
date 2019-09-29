/**
 * SUPER ULTRA RPG GAME
 * by @hec_linares
 * July 2019
 **/

#include <cpctelera.h>
#include <stdio.h>

char const sprites[] = {
   240, 0, 
   15, 1, 244, 15, 2, 8, 246, 15, 3, 8, 248, 
   15, 1, 8, 10, 245, 15, 2, 8, 247, 15, 3, 8, 249, 11, 0
};

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

u8 isFirmware11() {
   u8* p = (u8*)0xBAE4;
   return (p[0] - p[1]) == (p[2] - p[3]);
}

void symbolAfter10(u8 c, u16 matrixaddress) {
   *((u8*) 0xB294) = c;
   *((u8*) 0xB295) = 0xFF;
   *((u16*) 0xB296) = matrixaddress;
}

void symbolAfter11(u8 c, u16 matrixaddress) {
   *((u8*) 0xB734) = c;
   *((u8*) 0xB735) = 0xFF;
   *((u16*) 0xB736) = matrixaddress;
}

void symbol(u8 c, u8 vals[8]) {
   putchar(25);
   putchar(c);
   for(c = 0; c < 8; c++) {
      putchar(vals[c]);
   }
}

void pen(u8 color) {
   putchar(15);
   putchar(color);
}

void locate(u8 x, u8 y) {
   putchar(31);
   putchar(x);
   putchar(y);
}

void tontof(u8 t) {
   putchar(22);
   putchar(t);
}

void renderEnemy(u8 i) {
   locate(enemy[i].x, 5);
   tontof(1);   
   printf("%s", &sprites[enemy[i].sprite]);
   tontof(0);
   pen(1);
}

u8 FNr(u8 m) {
   return m-3+(cpct_rand()*7/255);
}

void enemyDecide(u8 i) {
   u8 f;
   if (enemy[i].x == x+1) {
      if (cpct_rand() < 64) {
         f = FNr(enemy[i].deffense);
         enemy[i].energy += f;
         locate(1,11);
         printf("ENEMY DEFENDS WITH FORCE: %d", f);
      } else {
         // ENEMY ATTACKS!
         f = FNr(enemy[i].attack);
         e -= f;
         locate(1,11);
         printf("ENEMY ATTACKS WITH FORCE: %d", f);
      }
   } else {
      // UPDATE ENEMY POSITION
      enemy[i].x += em[enemy[i].ei];
      enemy[i].ei++;
      if (enemy[i].ei > 3) enemy[i].ei = 0;
   }
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

u8 const UDG[] = { 
   /*240*/ 0x3E,0x22,0xE2,0x3E,0x08,0xFF,0x81,0xFF,
   /*241*/ 0x3C,0x24,0x3C,0x3C,0x18,0x98,0xE6,0xFE,
   /*242*/ 0x9A,0x18,0x18,0x3C,0x3C,0x66,0x66,0xE7,
   /*243*/ 0x9C,0x48,0x34,0xFE,0xFE,0x3C,0x54,0x94,
   /*244*/ 0x00,0x00,0x2F,0x3E,0x00,0x00,0x00,0x00,
   /*245*/ 0x10,0x14,0x94,0x14,0x1C,0x18,0x1E,0x00,
   /*246*/ 0x3E,0x7F,0x00,0x01,0x03,0x01,0x02,0x00,
   /*247*/ 0x00,0xC0,0x40,0x00,0x00,0x00,0x00,0x36,
   /*248*/ 0x00,0x00,0x00,0x00,0x3C,0x2E,0x24,0x3C,
   /*249*/ 0x0E,0x0B,0x2B,0x6B,0x43,0x06,0x00,0x00

 };


void main(void) {
   // Declare variables
   u8 f = 0;
   
   // Init variables
   enemies = 0;
   x = 4;
   e  = 100, a  = 30, d  = 15, f = 0;
   
   // ASM power!
   initMode();
   
   // Init enemies
   initEnemy(40,  15, 5);
   initEnemy(80,  20, 10);
   initEnemy(100, 25, 15);
   
   // Enable UDG
   if (isFirmware11()) {
      symbolAfter11(240, (u16)UDG);
   } else {
      symbolAfter10(240, (u16)UDG);
   }
   // symbol(250, UDG);
   
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
      putchar(240);
      
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
               if (enemy[0].energy > f) {
                  enemy[0].energy -= f;
               } else {
                  // ENEMY DIES!
                  enemy[0].energy = 0;
                  cpct_memcpy(&enemy[0], &enemy[enemies-1], sizeof(struct TEnemy));
                  enemies--;
               }
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
      for (u8 i = 0; i < enemies; i++) {
         enemyDecide(i);
      }
      
      // Is enter pressed?
      while (!cpct_isKeyPressed(Key_Enter)) {
         cpct_scanKeyboard();
      }
   }
}
