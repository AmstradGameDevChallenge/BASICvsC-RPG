# BASIC vs C: RPG

Desarrollo en directo de un juego de rol en BASIC y C para Amstrad CPC. 

Seguidnos en Twitter: [@FranGallegoBR](https://twitter.com/FranGallegoBR), [@Hec_Linares](https://twitter.com/Hec_Linares), [#TeamBASIC](https://twitter.com/hashtag/TeamBASIC), [#TeamC](https://twitter.com/hashtag/TeamC), [#AmstradGameDevChallenge](https://twitter.com/hashtag/AmstradGameDevChallenge)

## AVANCE EPISODIO 4: Misterio Memory Leak en BASIC

<a href="https://www.youtube.com/watch?v=dFCRWeQMxu4"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc03_game_thumb.png" alt="Avance Amstrad GameDev Challenge: #TeamBASIC misterio memory leak"/></a>

**Fecha**: Martes, 20 de agosto de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=dFCRWeQMxu4)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc03.zip)
<br/><br/><br/>

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
  <li><b>Noticias</b>:</li>
  <ul>
    <li>Actualización de #CPCtelera: añadido modificador -w para activar el modo Warp al inicio en RVM
  </ul>
  <li><b>Misterio en BASIC</b>:</li>
  <ul>
    <li>Recordatorio: al realizar varios ciclos de ejecución de nuestro juego, durante la ejecución, se pierden bytes de memoria
    </li><li>Comentarios de usuarios que han investigado y se han planteado dudas
    </li><li>Si la memoria se va perdiendo, ¿Se quedará nuestro programa al final sin memoria?
    </li><li>Usuario comenta que parece pederse la memoria en los INPUTs, que parece un fallo del firmware del #Amstrad
    </li><li>Revisión de la dirección de memoria &B08D que contiene datos del firmware: 'Final del espacio libre: byte antes de la zona de strings = HIMEM'
    </li><li>Detalle importante: hay 2 firmwares de Amstrad CPC, el 1.0 y el 1.1. Las variables del firmware están en direcciones distintas según la versión del firmware
    </li><li>Mapa básico de memoria del Amstrad CPC y definición de qué es HIMEM
    </li><li>Funcionamiento de los bancos de memoria y las ROMs del CPC a nivel básico
    </li><li>HIMEM: dirección más alta de espacio para el programa en BASIC (código y variables)
    </li><li>La zona de memoria de BASIC está protegida por el intérprete: no nos permite escribir en ella desde fuera.
    </li><li>La orden MEMORY sirve para cambiar HIMEM de posición: utilidades
    </li><li>Vemos el valor de HIMEM desde BASIC, usamos HEX$ para convertirlo y vamos a esa zona de memoria a ver qué hay
    </li><li>Cómo configurar el visor de memoria de RVM para mostrar contenido de RAM y ROM
    </li><li>Ponemos a prueba la zona de strings de BASIC (en HIMEM) asignando valores a a$ y vemos cómo reacciona la memoria
    </li><li>La zona de strings de BASIC almacena strings nuevos sin borrar antiguos: funciona como un Stack Allocator (un gestor de memoria tipo pila)
    </li><li>Esto explica el misterio: en cada ciclo del programa metemos valores nuevos en los strings con nuestros INPUT.
    </li><li>No es realmente un memory leak, sino una consecuencia del Stack Allocator, que funciona similar a lenguajes de script modernos.
    </li><li>Es una estrategia óptima para la gestión dinámica de la memoria de strings.
    </li><li>¿Hace este comportamiento que se nos pueda acabar la memoria? Creamos un programa para ponerlo a prueba
    </li><li>Cuando no queda memoria, BASIC libera la memoria de strings que ya no son usados, compactando los usados. Básicamente, recolecta la basura.
    </li><li>Potenciales ventajas e inconvenientes del funcionamiento de la memoria de strings
    </li><li>Controlar y liberar la memoria (recoger la basura) cuando nosotros queramos usando FRE("")
    </li><li>Usando UNT para evitar tener que hacer PRINT de FRE("") y no causar Overflows
    </li><li>añadiendo la recolección de basura a nuestro programa y poniéndolo a prueba
    </li><li>Observando el comportamiento de la memoria cuando forzamos la liberación de strings
    </li><li>Truquito en asignación de variables: uso de otras variables en lugar de valores inmediatos
    </li><li>Resolución de dudas planteadas en el chat
  </ul>
</ul>
</details>

## EPISODIO 3 [#AGC03](https://twitter.com/hashtag/AGC03)

<a href="https://www.youtube.com/watch?v=ezUGwy-jelE"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc03_game_thumb.png" alt="Amstrad GameDev Challenge: BASIC vs C. Episodio 3. #AGC03"/></a>

**Fecha**: Martes, 6 de agosto de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=ezUGwy-jelE)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc03.zip)
<br/><br/><br/>

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
  <li><b>Noticias</b>:</li>
  <ul>
    <li>Actualización en <a href="https://github.com/lronaldo/cpctelera/tree/development" rel="nofollow">CPCtelera 1.5 WIP</a>: Inclusión de soporte para STDC getchar()
    </li><li>#AmstradGameDevChallenge estará presente en <a href="http://www.retrozaragoza.com" rel="nofollow">RetroZaragoza 2019</a>: grabaremos un episodio en directo en persona.
  </ul>
  <li><b>Recomendación</b>: temática para los juegos RPG sobre leyendas reales de Castillos, Monasterios, Pueblos o lugares de la geografía española.
  </li><li><b>Preguntas y proyectos de los miembros del grupo</b>:</li>
  <ul>
    <li>Problema con la inicialización de variables globales en SDCC: no se les asigna valor.
    </li><li>Soluciones para variables globales: funciones de inicialización, valores constantes y punteros no constantes y copia de valores con <code>cpct_memcpy</code>
    </li><li>Sugerencia de uso de <code>grep</code> para eliminar los comentarios en BASIC.
    </li><li>Problema con <code>.gitignore</code> y la carpeta <code>obj/</code>
    </li><li>¿Cómo se puede hacer <code>SYMBOL AFTER</code> en C?
    </li><li>Apreciaciones sobre el uso de <code>cpct_setVideoMode</code>, el firmware y las funciones de CPCtelera.
    </li><li>Detalles a tener en cuenta en el uso de <code>OPENIN</code> y <code>OPENOUT</code> en BASIC
  </ul>
  <li><b>Misterio en BASIC</b>:</li>
  <ul>
    <li>Pérdidas de memoria en nuestro juego. ¿A qué se deben? Dos semanas para encontrar la respuesta.</li>
  </ul>
  </li><li><b>Desarrollo</b>:</li>
  <ul>
    <li>Inicialización rápida y fácil de la pantalla, los colores y el módulo de texto sin tener que ajustarlo todo a mano.
    </li><li>Llamadas a funciones del firmware con código ensamblador en línea: nota sobre potenciales problemas
    </li><li>Creación y manejo de <code>structs</code> en C: ¿Qué son? ¿Cómo funcionan?
    </li><li>Introducción de espacio para múltiples enemigos usando un array de structs en C
    </li><li>Importancia de los comentarios en BASIC: usarlos como referencia de variables y estructuras de memoria
    </li><li>Simulación de structs en BASIC usando arrays y prefijos de nombre
    </li><li>Uso de una referencia variable a un elemento para generalizar el código previo directamente
    </li><li>Diseño básico de un gestor de enemigos: creación y destrucción
    </li><li>Visualización de múltiples enemigos e interacción: problemas asociados
    </li><li>Gestión del array de enemigos al eliminar uno de ellos: posibles alternativas
    </li><li>Añadiendo color a los enemigos como forma de distinguirlos
  </ul>
</ul>
</details>


## EPISODIO 2 [#AGC02](https://twitter.com/hashtag/AGC02)

<a href="https://www.youtube.com/watch?v=5qsZ1lnEPCQ"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc02_game_thumb.png" alt="Amstrad GameDev Challenge: BASIC vs C. Episodio 2. #AGC02"/></a>

**Fecha**: Martes, 23 de julio de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=5qsZ1lnEPCQ)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc02.zip)
<br/><br/><br />

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
  <li>Noticias:</li>
  <ul>
    <li>Anuncio oficial del <a href="http://cpcretrodev.byterealms.com/contest/cpc-retrodev-2019/" rel="nofollow">#CPCRetroDev 2019</a></li>
  </ul>
  <li>Revisión de proyectos en desarrollo de los miembros del <a href="https://twitter.com/hashtag/TeamC" rel="nofollow">#TeamC</a> y el <a href="https://twitter.com/hashtag/TeamBASIC" rel="nofollow">#TeamBASIC</a>
  </li><li>Desarrollo:</li>
  <ul>
  <li>Creación de un script bash para generar un DSK a partir del fichero .BAS
  </li><li>Comentarios que no ocupan memoria en BASIC
  </li><li>Reemplazo y uso de variables con nombre corto en BASIC
  </li><li>Usando <code>LOCATE</code> desde C para dibujar personajes en una posición concreta
  </li><li>Uso de funciones y parámetros en C para reutilizar y simplificar el código
  </li><li>Diferencias entre las funciones <code>printf</code> y <code>puts</code> y uso del firmware
  </li><li>Análisis de estartegias más óptimas de programación en C usando el código ensamblador generado
  </li><li>Uso de las funciones <code>CHR$</code> y <code>STRING$</code> en BASIC para pintar caracteres y repetirlos
  </li><li>Movimiento de los personajes en una dimensión y ataque por movimiento
  </li><li>Uso de <code>GOSUB</code> y subrutinas en BASIC para modularizar el código
  </li><li>Dudas sobre paso de parámetros a funciones y subrutinas en BASIC y C
  </li><li>Detalle sobre las comparaciones y asignaciones en C
  </li><li>Introducción a los arrays en C y BASIC
  </li><li>Funciones aleatorias simples para ataques variables en juegos de ROL
  </li><li>Definición de funciones matemáticas en BASIC
  </li><li>Cálculos enteros y reales y redondeos en BASIC y C
  </li><li>Uso de <code>RANDOMIZE</code> para controlar las secuencias pseudoaleatorias
  </ul>
</ul>
</details>

## EPISODIO 1 [#AGC01](https://twitter.com/hashtag/AGC01)

<a href="https://www.youtube.com/watch?v=TFEnGYmOOLI"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc01_teamBASIC_thumb.png" alt="Amstrad GameDev Challenge: BASIC vs C. Episodio 1. #AGC01"/></a>

**Fecha**: Martes, 9 de julio de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=TFEnGYmOOLI)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc01.zip)
<br/><br/><br />

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
<li>Presentación de la serie
  </li><li>Herramientas a utilizar y organización
  </li><li>Implementado un esquema inicial muy básico de juego y bucle principal emergente, sin apenas estructurar.
  </li><li>Primeros pasos con variables
  </li><li>Player y enemigo con energía, ataque y defensa
  </li><li>Player y enemigo atacan y defienden
  </ul>
</details>

# Materiales

- [Solicitud de inscripción a la organización de Github](http://bit.ly/AGC01)
- [CPCtelera](http://lronaldo.github.io/cpctelera/)
- [CPCtelera 1.5 WIP](https://github.com/lronaldo/cpctelera/tree/development)
- [CPCtelera Manual de Referencia](http://lronaldo.github.io/cpctelera/files/readme-txt.html)
- [Manual del usuario de Amstrad CPC 464 1987](https://archive.org/details/Amstrad_CPC464_Manual_del_Usuario_1987_Amstrad_ES_a)
- [Manual del firmware del Amstrad CPC](http://www.cantrell.org.uk/david/tech/cpc/cpc-firmware/)

Cread vuestros repositorios en [AmstradGameDevChallenge](https://github.com/AmstradGameDevChallenge/) y empezad vuestros propios RPG en BASIC y C. En el próximo episodio los analizaremos en directo y compartiremos las ideas de programación entre todos.
