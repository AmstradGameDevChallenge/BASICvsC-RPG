
#include <stdio.h>
#include <sys/RenderSystem.h>
#include <utils/cpc.h>
#include <assets/UDG.h>
#include <cmp/TEntity.h>
#include <man/EntityManager.h>
#include <man/MapManager.h>

void sys_render_init() {
   // Init
   initMode();
   
   // Enable UDG
   if (isFirmware11()) {
      symbolAfter11(232, (u16)UDG);
   } else {
      symbolAfter10(232, (u16)UDG);
   }
}

// Renders a welcome message
void sys_render_welcome_message() {
   cls();

   locate(1,1);
   renderString('#', 40);
   locate(1,2);
   puts("#    - WELCOME TO DUNGEON CASTLE -     #");
   locate(1,3);
   puts("#       [PRESS ANY KEY TO START]       #");
   locate(1,4);
   renderString('#', 40);
}

void sys_render_map() {
   const u8* map = man_map_get_current_map();
   u16 i;

   tontof(1);
   for (i = 0; i < 20*40; i++) {
      if (map[i] > 32) {
         printf(&sprites[42]);
      } else {
         putchar(' ');
      }
   }
   tontof(0);
}

void sys_render_update() {
   struct TEntity *entities = man_entity_get_entities();
   
   for (int i = 0; i < man_entity_get_num_entities(); i++) {
      struct TEntity *e = &entities[i];
      // Clear entity
      locate(e->prev.x, e->prev.y);
      printf("  %c%c%c  ", 8, 8, 10);

      // Render entity
      locate(e->pos.x, e->pos.y);
      tontof(1);
      printf("%s", &sprites[e->ren.sprite]);
      tontof(0);
      pen(1);
   }
}
