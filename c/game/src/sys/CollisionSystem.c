
#include <cpctelera.h>
#include <man/EntityManager.h>
#include <man/MapManager.h>

void sys_collision_init() {
   
}

void sys_collision_update() {
    struct TEntity *e = man_entity_get_entities();
    const u8* map = man_map_get_current_map();
    
    for (u8 i = e->pos.x; i < (e->pos.x + e->ren.w); i++ ) {
        for (u8 j = e->pos.y; j < (e->pos.y + e->ren.h); j++ ) {
            if (map[(j-1)*40 + (i-1)] != ' ') {
                e->pos.x = e->prev.x;
                e->pos.y = e->prev.y;
            }
        }
    }
   
}
