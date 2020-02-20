
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
   entities[m_num_entities].pos.x = 2;
   entities[m_num_entities].pos.y = 3;
   entities[m_num_entities].phys.vx = 0;
   entities[m_num_entities].phys.vy = 0;
   entities[m_num_entities].ren.w = 1;
   entities[m_num_entities].ren.h = 1;
   entities[m_num_entities].ren.sprite = 0;
   entities[m_num_entities].energy = 100;
   entities[m_num_entities].attack = 20;
   entities[m_num_entities].deffense = 10;
   entities[m_num_entities].force = 0; 
   
   m_num_entities++;
   
}

struct TEntity* man_get_entities() {
   return entities;
}

u8 man_get_num_entities() {
   return m_num_entities;
}
