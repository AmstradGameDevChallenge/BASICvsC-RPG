/**
 * SUPER ULTRA RPG GAME
 * by @hec_linares
 * July 2019
 **/

#include <cpctelera.h>
#include <stdio.h>

u8 FNr(u8 m) {
   return m-3+(cpct_rand()*7/255);
}

void locate(u8 x, u8 y) {
   putchar(31);
   putchar(x);
   putchar(y);
}

void renderString(u8 ch, u8 n) {
   while(n--) {
      putchar(ch);
   }
}

void main(void) {
   // Init variables
   u8 e  = 100, a  = 30, d  = 15, x = 4, f = 0; 
   u8 ee = 90,  ea = 20, ed = 10, ex = 7, ei = 0;
   
   i8 em[4] = {-1, 1, 1, -1};
      
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
      printf("ENEMY  [%d] (a%d) (d%d)\r\n", ee, ea, ed);
      
      // RENDER PLAYER
      locate(x, 6);
      putchar(250);
      
      // RENDER ENEMY
      locate(ex, 6);
      putchar(224);
      
      // RENDER GROUND
      locate(1, 7);
      renderString(143, 10);
      locate(1, 8);
      renderString(216, 10);
      
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
            if(x == ex) {
               x--;
               locate(1,10);
               f = FNr(a);
               ee -= f;
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
      if (ex == x+1) {
         if (cpct_rand() < 64) {
            f = FNr(ed);
            ee += f;
            locate(1,11);
            printf("ENEMY DEFENDS WITH FORCE: %d", f);
         } else {
            // ENEMY ATTACKS!
            f = FNr(ea);
            e -= f;
            locate(1,11);
            printf("ENEMY ATTACKS WITH FORCE: %d", f);
         }
      } else {
         // UPDATE ENEMY POSITION
         ex += em[ei];
         ei++;
         if (ei > 3) ei = 0;
      }
      
      // Is enter pressed?
      while (!cpct_isKeyPressed(Key_Enter)) {
         cpct_scanKeyboard();
      }
   }
}
