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
#include <man/EntityManager.h>

void main() {
   
   man_entity_init();
   sys_render_init();
   sys_physics_init();
   sys_input_init();
   
   man_entity_create();
   man_entity_create();
   
   while(1) {
      sys_input_update();
      sys_physics_update();
      sys_render_update();
   }
   
}
