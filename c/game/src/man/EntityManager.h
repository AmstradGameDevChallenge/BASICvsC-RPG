#ifndef ENTITY_MANAGER_H__
#define ENTITY_MANAGER_H__

#include <stdio.h>
#include <cmp/TEntity.h>

void man_entity_create();
void man_entity_init();
struct TEntity* man_entity_get_entities();
u8 man_entity_get_num_entities();

#endif