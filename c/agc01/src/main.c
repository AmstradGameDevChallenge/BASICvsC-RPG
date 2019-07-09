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
   u8 defenseen = 3;
   
   // Let's start!
   printf("RPG GAME\r\n");
   printf("\r\n");
   printf("PRESS ENTER TO START\r\n");
   
   // Is enter pressed?
   while (!cpct_isKeyPressed(Key_Enter)) {
      cpct_scanKeyboard();
   }
   
   // CLS
   putchar(12);
   
   // GAME START
   printf("GAME START\r\n");
   
   // Print stats
   printf("PLAYER [%d] (a%d) (d%d)\r\n", energy,   attack,   defense);
   printf("ENEMY  [%d] (a%d) (d%d)\r\n", energyen, attacken, defenseen);
   
   // Loop forever
   while (1);
}
