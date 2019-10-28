
#include <cpctelera.h>
#include <cmp/TEntity.h>
#include <man/EntityManager.h>

void sys_input_init() {
   
}

void sys_input_update() {
   struct TEntity *entities = man_get_entities();
   
   do
      cpct_scanKeyboard();
   while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_Q) && !cpct_isKeyPressed(Key_A));
   
   if (cpct_isKeyPressed(Key_O)) {
      entities[0].phys.vx = -1;
   }
   if (cpct_isKeyPressed(Key_P)) {
      entities[0].phys.vx = 1;
   }
   if (cpct_isKeyPressed(Key_Q)) {
      entities[0].phys.vy = -1;
   }
   if (cpct_isKeyPressed(Key_A)) {
      entities[0].phys.vy = 1;
   }
}
