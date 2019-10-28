
#include <stdio.h>
#include <sys/RenderSystem.h>
#include <utils/cpc.h>
#include <assets/UDG.h>
#include <cmp/TEntity.h>
#include <man/EntityManager.h>

void sys_render_init() {
   // Init
   initMode();
   
   // Enable UDG
   if (isFirmware11()) {
      symbolAfter11(240, (u16)UDG);
   } else {
      symbolAfter10(240, (u16)UDG);
   }
}

void sys_render_update() {
   struct TEntity *entities = man_get_entities();
   
   cls();
   
   for (int i = 0; i < man_get_num_entities(); i++) {
      struct TEntity *e = &entities[i];
      locate(e->pos.x, e->pos.y);
      tontof(1);
      printf("%s", &sprites[e->ren.sprite]);
      tontof(0);
      pen(1);
   }
}
