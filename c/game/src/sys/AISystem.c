
#include <cpctelera.h>
#include <man/EntityManager.h>

void sys_ai_init() {
   
}

void sys_ai_update() {
    struct TEntity *e = man_entity_get_entities();
    for (u8 i = 0; i < man_entity_get_num_entities(); i++) {
        if (e->phys.collided) {
            e->phys.vx = -e->phys.vx;
            e->phys.vy = -e->phys.vy;
        }
        e++;
    }
   
}
