
#include <cpctelera.h>
#include <cmp/TEntity.h>
#include <man/EntityManager.h>

void sys_physics_init() {
   
}

void sys_physics_update() {
   struct TEntity *entities = man_get_entities();
   
   for (u8 i = 0; i < man_get_num_entities(); i++) {
      entities[i].pos.x += entities[i].phys.vx;
      entities[i].pos.y += entities[i].phys.vy;
      
      entities[i].phys.vx = 0;
      entities[i].phys.vy = 0;
   }
   
   
   
}
