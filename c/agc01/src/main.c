/**
 * SUPER ULTRA RPG GAME
 * by @hec_linares
 * July 2019
 **/

#include <cpctelera.h>
#include <stdio.h>

void main(void) {
   // Init variables
   u8 energy    = 100;
   u8 attack    = 30;
   u8 defense   = 15;
   u8 energyen  = 90;
   u8 attacken  = 20;
   u8 defenseen = 10;
   
   // Let's start!
   printf("RPG GAME\r\n");
   printf("\r\n");
   printf("PRESS ENTER TO START\r\n");
   
   // Is enter pressed?
   while (!cpct_isKeyPressed(Key_Enter)) {
      cpct_scanKeyboard();
   }

   while (1) {

      // CLS
      putchar(12);
      
      // Print stats
      printf("PLAYER [%d] (a%d) (d%d)\r\n", energy,   attack,   defense);
      printf("ENEMY  [%d] (a%d) (d%d)\r\n", energyen, attacken, defenseen);
      
      // Re scan keyboard
      cpct_scanKeyboard();
      
      while (!cpct_isKeyPressed(Key_A) && !cpct_isKeyPressed(Key_D)) {
         cpct_scanKeyboard();
      }
         
      // PLAYER ATTACKS!
      if (cpct_isKeyPressed(Key_A)) {
         energyen -= attack;
      } else {
         // PLAYER DEFENDS!
         if (cpct_isKeyPressed(Key_D)) {
            energy += defense;
         }
      }
      
      // ENEMY DECIDE
      if (cpct_rand() < 64) {
         energyen += defenseen;
      } else {
         energy -= attacken;
      }
   }

   // Loop forever
   while (1);
}
