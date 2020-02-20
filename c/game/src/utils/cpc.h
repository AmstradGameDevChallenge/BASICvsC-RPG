
#ifndef UTILS_CPC_H__
#define UTILS_CPC_H__

#include <cpctelera.h>

void cls();

u8 isFirmware11();

void symbolAfter10(u8 c, u16 matrixaddress);

void symbolAfter11(u8 c, u16 matrixaddress);

void symbol(u8 c, u8 vals[8]);

void pen(u8 color);

void locate(u8 x, u8 y);

void tontof(u8 t);

void renderString(u8 ch, u8 n);

void initMode();

void pressAnyKey();

#endif
