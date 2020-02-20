/**
 * CPC TOOLS
 * */
#include <utils/cpc.h>
#include <stdio.h>

void cls() {
   putchar(12);
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

void pressAnyKey() {
   do
      cpct_scanKeyboard();
   while (!cpct_isAnyKeyPressed_f());
}