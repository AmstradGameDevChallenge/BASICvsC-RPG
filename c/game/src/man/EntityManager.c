
#include <stdio.h>
#include <cmp/TEntity.h>
#include <man/EntityManager.h>

#define MAX_ENTITIES 10

u8 m_num_entities;

// Store all entities in one array
// Assume entity[0] is the player
struct TEntity entities[MAX_ENTITIES];

// Entity manager init
void man_entity_init() {
   m_num_entities = 0;
}

// Create a new entity
void man_entity_create() {
   struct TEntity *e = &entities[m_num_entities];
   e->pos.x = 2;
   e->pos.y = 3;
   e->prev.x = e->pos.x;
   e->prev.y = e->pos.y;
   e->phys.vx = 0;
   e->phys.vy = 0;
   e->ren.w = 2;
   e->ren.h = 2;
   e->ren.sprite = 0;
   e->energy = 100;
   e->attack = 20;
   e->deffense = 10;
   e->force = 0; 
   
   m_num_entities++;
   
}

struct TEntity* man_entity_get_entities() {
   return entities;
}

u8 man_entity_get_num_entities() {
   return m_num_entities;
}
