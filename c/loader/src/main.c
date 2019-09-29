//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>

////////////////////////////////////////////////
/// VERTICAL SCREEN SWITCHING EFFECT
/// It makes current screen disappear and 
/// reappear performing an vertical slider
/// effect.
/// It changes CRTC Register 6. This register
/// controls the number of vertical characters
/// a screen shows. By default they are 25, and
/// this routine decreases it one by one down to
/// 0, then switches screens, then increases 
/// characters again up to 25.
/// INPUT
///   newVideoPage: new video page to show after switching
////////////////////////////////////////////////
void verticalEffect(u8 newVideoPage) {
   u8 i;

   // Vertical disappearing effect
   // Decrease number of vertical characters shown
   for (i = 25; i > 0; i--) {
      cpct_setCRTCReg(6, i);
      // Ensure we wait until VSYNC signal is enabled
      // and disabled again.
      cpct_waitVSYNC();
      for (u8 j = 0; j < 100; j++) {}
   }

   // Change video memory displayed to new page
   cpct_setVideoMemoryPage(newVideoPage);

   // Vertical reappearing effect
   // Increase number of vertical characters shown
   for (i = 0; i <= 25; i++) {
      cpct_setCRTCReg(6, i);
      // Ensure we wait until VSYNC signal is enabled
      // and disabled again.
      cpct_waitVSYNC();
      for (u8 j = 0; j < 100; j++) {}
   }  
}

////////////////////////////////////////////////
/// HORIZONTAL SCREEN SWITCHING EFFECT
/// It makes current screen disappear and 
/// reappear performing an horizontal slider
/// effect.
/// It changes CRTC Register 1. This register
/// controls the number of horizontal characters
/// a screen shows. By default they are 40, and
/// this routine decreases it one by one down to
/// 0, then switches screens, then increases 
/// characters again up to 40.
/// INPUT
///   newVideoPage: new video page to show after switching
////////////////////////////////////////////////
void horizontalEffect(u8 newVideoPage) {
   u8 i;

   // Horizontal disappearing effect
   // Decrease number of horizontal characters shown
   for (i = 40; i > 0; i--) {
      cpct_setCRTCReg(1, i);
      // Ensure we wait until VSYNC signal is enabled
      // and disabled again.
      cpct_waitVSYNC();
      for (u8 j = 0; j < 100; j++) {}
   }

   // Change video memory displayed to new page
   cpct_setVideoMemoryPage(newVideoPage);

   // Horizontal reappearing effect
   // Increase number of horizontal characters shown
   for (i = 0; i <= 40; i++) {
      cpct_setCRTCReg(1, i);
      // Ensure we wait until VSYNC signal is enabled
      // and disabled again.
      cpct_waitVSYNC();
      for (u8 j = 0; j < 100; j++) {}
   }
}

////////////////////////////////////////////////
/// STORY SCREEN LOADER
/// Loads 4 screens that show the story of the
/// game. It loads screens using a double buffer
/// approach and changes from each one to the
/// next performing some simple screen effects.
////////////////////////////////////////////////
void loadScreens() {
   // Load first Screen at 0x4000 so that 
   // last screen is loaded at 0xC000
   cpct_setVideoMemoryPage(cpct_page40);
   cpct_miniload((void*)0x4000, 0x4000);

   // Load 2nd Screen at 0xC000 current backbuffer
   // (0x4000 is being displayed, 0xC000 not)
   cpct_miniload((void*)0xC000, 0x4000);
   // Change to 0xC000 doing an horizontal effect
   horizontalEffect(cpct_pageC0);

   // Load 3rd Screen at 0x4000 current backbuffer
   // Then show it with a vertical change effect
   cpct_miniload((void*)0x4000, 0x4000);
   verticalEffect(cpct_page40);

   // Load 4th and finall screen into 0xC000
   // Then show it with another horizontal change effect
   cpct_miniload((void*)0xC000, 0x4000);
   horizontalEffect(cpct_pageC0);   

   // Video Memory is finally left at 0xC000
   // as it initially was
}

// We need to know where in memory to load our game binary 
// (Game Load Address) and where in memory does game's main()
// function code start (Game Run Address).
// These data is easily obtained by looking at game/obj/binaryAddresses.log
// The size of our game binary can also be obtained by
// looking at our generated game/obj/game.bin (with 
// some ls -l command or similar)
//
#define GAME_LOAD_ADDRESS  (void*)0x4000
#define GAME_RUN_ADDRESS   (void*)0x433B 
#define GAME_BIN_SIZE      4924

////////////////////////////////////////////////
// LOADER MAIN ENTRY POINT
////////////////////////////////////////////////
void main(void) {
   // Define a function pointer that will be used 
   // to point and call to our game's main() function code.
   void (*gameMain)(void);

   // Disable firmware and Set Video Mode
   cpct_disableFirmware();
   cpct_setVideoMode(0);

   // Load screens
   loadScreens();

   // Load game and call gameMain
   cpct_miniload(GAME_LOAD_ADDRESS, GAME_BIN_SIZE);
   gameMain = GAME_RUN_ADDRESS;
   gameMain();
}
