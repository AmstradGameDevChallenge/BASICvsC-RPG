#ifndef MAP_MANAGER_H__
#define MAP_MANAGER_H__

#include <stdio.h>
#include <cmp/TMap.h>

void man_create_init();
const u8* man_map_get_current_map();
u8 man_map_get_num_maps();
void man_map_init();
#endif