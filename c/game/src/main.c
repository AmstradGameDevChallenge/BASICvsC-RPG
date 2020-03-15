/**
 * SUPER ULTRA RPG GAME
 * by @hec_linares
 * July 2019
 **/

#include <cpctelera.h>
#include <stdio.h>
#include <sys/RenderSystem.h>
#include <sys/InputSystem.h>
#include <sys/PhysicsSystem.h>
#include <sys/CollisionSystem.h>
#include <man/EntityManager.h>
#include <man/MapManager.h>
#include <utils/cpc.h>

void main() {
   
   // Init managers and systems :)
   man_entity_init();
   sys_render_init();
   sys_physics_init();
   sys_input_init();
   
   // Create first entity, the player
   man_entity_create();

   // Welcome message
   sys_render_welcome_message();
   pressAnyKey();
   
   cls();
   man_map_init();
   sys_render_map();
   
   // Main game loop
   while(1) {
      // Update input
      sys_input_update();
      
      // Update physics
      sys_physics_update();

      // Update collisions
      sys_collision_update();

      // Update render system
      sys_render_update();
   }
   
}
