
#include <stdio.h>
#include <cpctelera.h>
#include <cmp/TMap.h>
#include <man/MapManager.h>

#define MAX_MAPS 2

u8 m_current_map;

// Map manager init
void man_map_init() {
   m_current_map = 1;
}

const u8* man_get_current_map() {
   return TMap[m_current_map];
}

u8 man_get_num_maps() {
   return MAX_MAPS;
}
