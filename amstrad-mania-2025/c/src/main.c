#include <cpctelera.h>
#include <stdlib.h>
#include <time.h>

#define SCREEN_W    80
#define SCREEN_H    200
#define MAX_OBSTACLES 3
#define GROUND_Y 170
#define PLAYER_X 10

typedef struct {
    u8 y;
    u8 speed;
    u8 isJumping;
    u8* sprite;
} Player;

typedef struct {
    u8 x;
    u8 speed;
    u8 isActive;
} Obstacle;

const u8 playerSprite[] = {
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00,
    0x00, 0x01, 0x01, 0x00
};

const u8 obstacleSprite[] = {
    0x00, 0x10, 0x04, 0x00,
    0x00, 0x40, 0x01, 0x00,
    0x10, 0x00, 0x00, 0x04,
    0x40, 0x00, 0x00, 0x01,
    0x55, 0x55, 0x55, 0x55,
    0x00, 0x10, 0x01, 0x00,
    0x00, 0x10, 0x01, 0x00,
    0x00, 0x10, 0x01, 0x00,
    0x00, 0x10, 0x01, 0x00,
    0x00, 0x10, 0x01, 0x00
};

// Palette Blue, Red, Green, Black
const u8 palette[4] = {11, 3, 9, 0};
u32 frameCounter = 0;
u8 ended = 0;
u8 dead = 0;

Player player;
Obstacle obstacles[MAX_OBSTACLES];

// Dibuja el suelo
void drawGround(void) {
    // Obtenemos puntoreo a la pantalla
    u8 i;
    u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, 0, GROUND_Y);
    
    for(i = 0; i < SCREEN_W; i++) {
        *pvideo++ = 0x33;
    }
}

// Se encarga de actualizar la posición del jugador
void updatePlayer(void) {
    if(cpct_isKeyPressed(Key_Space) && !player.isJumping) {
        player.isJumping = 1;
        player.speed = -8;
    }

    player.y += player.speed;

    if(player.y < GROUND_Y - 12) {
        player.speed += 1;
    } else {
        player.y = GROUND_Y - 12;
        player.isJumping = 0;
        player.speed = 0;
    }
    
}

void spawnObstacle(void) {
    // Find an available obstacle
    for(u8 i = 0; i < MAX_OBSTACLES; i++) {
        if(obstacles[i].isActive == 0) {
            // Init and activate obstacle
            obstacles[i].isActive = 1;
            obstacles[i].speed = 1;
            obstacles[i].x = SCREEN_W - 8;
            break;
        }
    }
}

void updateObstacles(void) {
    // Update active obstacles
    for(u8 i = 0; i < MAX_OBSTACLES; i++) {
        if(obstacles[i].isActive) {
            obstacles[i].x -= obstacles[i].speed;
            if(obstacles[i].x < 9) {
                obstacles[i].isActive = 0;
            }
        }
    }
}

void drawObstacles(void) {
    u8* pvideo;
    for(u8 i = 0; i < MAX_OBSTACLES; i++) {
        if(obstacles[i].isActive) {
            pvideo = cpct_getScreenPtr(CPCT_VMEM_START, obstacles[i].x, GROUND_Y - 10);
            cpct_drawSprite(obstacleSprite, pvideo, 4, 10);
        }
    }
}

// Dibuja el jugador en su posición actual
void drawPlayer(void) {
    u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, PLAYER_X, player.y);
    cpct_drawSprite(player.sprite, pvideo, 4, 12);
}

void checkCollision(void) {
    // Checkear colisión entre el jugador y los obstáculos activos
    for(u8 i = 0; i < MAX_OBSTACLES; i++) {
        if(obstacles[i].isActive) {
            if(player.y + 12 >= GROUND_Y - 10 && PLAYER_X > obstacles[i].x && PLAYER_X < obstacles[i].x + 8) {
                dead = 1;
            }
        }
    }
}

int main(void) {
    u32 i;
    u8 nextObstacle = 10;

    srand(time(NULL));
    
    // Inicializamos el jugador
    player.y = GROUND_Y - 12;
    player.speed = 0;
    player.isJumping = 0;
    player.sprite = playerSprite;

    // Desactivamos el firmware
    cpct_disableFirmware();

    // Convertimos la paleta del firmware a la paleta del hardware    
    cpct_fw2hw(palette, 4);

    // Seteamos la paleta
    cpct_setPalette(palette, 4);

    // Seteamos el modo de video
    cpct_setVideoMode(1);

    // Seteamos el borde
    cpct_setBorder(palette[1]);

    // Bucle principal del juego
    while(!ended) {
        if(!dead) {
            // Incrementamos el contador de frames
            frameCounter++;

            // Limpiamos la pantalla
            cpct_clearScreen_f64(0);

            // Generamos nuevos obstáculos
            if(frameCounter % nextObstacle == 0) {
                spawnObstacle();
                nextObstacle = rand() % 20 + 10;
            }

            // Pintamos el suelo
            drawGround();

            // Actualizamos el jugador
            updatePlayer();

            // Actualizamos los obstáculos
            updateObstacles();

            // Pintamos el jugador
            drawPlayer();

            // Pintamos los obstáculos
            drawObstacles();
            
            // Comprobamos colisiones
            checkCollision();
            
            // Check end condition
            cpct_scanKeyboard_f();
            if(cpct_isKeyPressed(Key_Esc)) {
                ended = 1;
            }
        } else {
            dead = 0;

            // Control de velocidad (esperar un poco)
            for(i = 0; i < 10000; i++);
        }

        // Control de velocidad (esperar un poco)
        for(i = 0; i < 1000; i++);
    }

    return 0;
}
