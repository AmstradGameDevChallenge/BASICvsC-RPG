# BASIC vs C: RPG

Desarrollo en directo de un juego de rol en BASIC y C para Amstrad CPC. 

Seguidnos en Twitter: [@FranGallegoBR](https://twitter.com/FranGallegoBR), [@Hec_Linares](https://twitter.com/Hec_Linares), [#TeamBASIC](https://twitter.com/hashtag/TeamBASIC), [#TeamC](https://twitter.com/hashtag/TeamC), [#AmstradGameDevChallenge](https://twitter.com/hashtag/AmstradGameDevChallenge)

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
