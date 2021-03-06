# BASIC vs C: RPG

Desarrollo en directo de un juego de rol en BASIC y C para Amstrad CPC. 

Seguidnos en Twitter: [@FranGallegoBR](https://twitter.com/FranGallegoBR), [@Hec_Linares](https://twitter.com/Hec_Linares), [#TeamBASIC](https://twitter.com/hashtag/TeamBASIC), [#TeamC](https://twitter.com/hashtag/TeamC), [#AmstradGameDevChallenge](https://twitter.com/hashtag/AmstradGameDevChallenge)

## EPISODIO 5: Game Design, modelo ECS y más [#AGC05](https://twitter.com/hashtag/AGC05)

<a href="https://www.youtube.com/watch?v=YQ6obw_M9B4"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc05_design_thumb.png" alt="Amstrad GameDev Challenge: BASIC vs C. Episodio 5. Game Design, modelo ECS y más. #AGC05"/></a>
**Fecha**: Martes, 11 de septiembre de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=YQ6obw_M9B4)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc05.zip)
|| [**>> Plantilla Doc. Diseño <<**](http://bit.ly/AGC-GDD_es) || [**>> Game Design Doc. Template <<**](http://bit.ly/AGC-GDD_en)
<br/><br/><br/>

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
  <li><b>Noticias</b>:</li>
  <ul>
    <li>Taller de #AmstradGameDevChallenge en RetroZaragoza 2019 (28/09/2019 16:00h). Inscipciones abiertas. Se intentará emitir en directo.
    </li><li>Novedad en #AGC05: Cronómetro para las intervenciones del #TeamC y el #TeamBASIC. 15 minutos + 5 extra por intervención.
    </li><li>Acalaración respecto a #AGC y el #CPCRetroDev 
  </ul>
  </li><li><b>Desarrollo</b>:</li>
  <ul>
    <li>BASIC:</li>
    <ul>
      <li>Revisión de nuevo tipo de Memory Leak en BASIC:
      </li><li>Hay un problema al realizar SYMBOL AFTER. Se reserva nueva memoria para los UDGs donde esté en ese momento HIMEM. 
      </li><li>Es importante realizar un SYMBOL AFTER 256 al inicio del programa para liberar la memoria reservada para UDGs antes de reservar nueva.
      </li><li>Observamos problemas que pueden ocurrir con el uso de SYMBOL AFTER y otros comandos que manejen HIMEM, como por ejemplo los CALL de inicialización (&BBFF y &BB4E)
      </li><li>Analizamos un problema importante de consumo de memoria en BASIC: el código que usamos para definir los UDG ocupa mucho espacio
      </li><li>Vemos como utilizar la orden CHAIN MERGE para tener 2 programas separados que se encadenan: uno inicializa todo (variables, UDGs, etc) y otro sólo ejecuta, pero solo tiene los datos, y no el código de inicialización, ahorrando memoria.
      </li><li>Solucionamos un problema de inicialización con DEFINT, que elimina todas las variables previamente definidas.
      </li><li>Nota importante: La opción CHAIN MERGE funciona bien con programas BASIC binarios. Sin embargo, con programas BASIC en formato ASCII no funciona bien en los 464 y 664: hay un bug en el firmware.
      </li>
    </ul>
    <li>Game Design</li>
    <ul>
      <li>Proponemos un formato de documento para Game Design con una estructura concreta ayudar a estructurar nuestras ideas de juego.
      </li><li>Revisamos el documento y sus apartados y vemos la utilidad y que significa cada uno de ellos.
      </li><li>Vemos los principios iniciales de Game Design de nuestro juego, Dungeon Castles.
      </li><li>Vemos bocetos y modelos a utilizar para el diseño y desarrollo del juego.
      </li><li>Hablamos de lo importante que es tener modelos de referencia en los que basarse para las mecánicas.        
      </li><li>Vemos la historia de los castillos de Alicante, base de nuestro juego Dungeon Castles.
      </li><li>Revisamos los apartados del documento en el caso de nuestro juego y cómo los hemos rellenado inicialmente.
      </li><li>Entendemos cómo evitar el bloating (sobrecrecimiento) de características
      </li><li>Hablamos del mapeado en nuestro juego y ponemos ejemplos de algunos tipos de mapa en su diseño inicial.
      </li><li>Diseñamos unos tipos concretos de objetos que deben haber en nuestro juego y cómo funcionarán.
      </li><li>Seleccionamos unas mecánicas concretas de combate y debatimos sobre ellas
      </li><li>Vemos también como muy importante el diseño iterativo y cómo afrontar correctamente las iteraciones.
      </li><li>Explicamos lo que es el Mínimo producto viable (MVP en inglés) y cómo definirlo y trabajar en él para empezar.        
      </li><li>Debatimos sobre cómo diseñar un MVP y cómo seleccionar mecánicas simples para que sea un produto completo
      </li>
    </ul>
    <li>Technical Design (Diagramas y ECS)</li>
    <ul>
      <li>Vemos por qué es importante realizar diagramas técnicos del funcionamiento de nuestro código
      </li><li>Conforme un programa crece es imposible mantener en la cabeza todo el código, lo que hace y cómo funciona
      </li><li>Explicamos que los diagramas no se elaboran como siempre se explica en ingeniería: primero el diagrama completo y luego pogramar. Esto no funciona habitualmente así.
      </li><li>Entendemos que los diagramas técnicos deben ser algo vivo, que se mantiene actualizado y que se usa para reflexionar, diseñar y para entender nuestro código al completo.
      </li><li>Vemos un ejemplo de diagrama de llamadas realizado con draw.io
      </li><li>Con el diagrama entendemos la estructura de llamadas entre las distintas partes del código y las dependencias que eso implica        
      </li><li>Vemos que la estructura de nuestro juego se está complicando mucho y eso teniendo en cuenta que sólo hemos hecho unas pocas partes.
      </li><li>Para evitar que la estructura siga complicándose y el código llegue pronto a ser inmanejable, vemos otras posibles estructuras mejores
      </li><li>Hablamos del modelo Entidad-Componente-Sistema (ECS: Entity-Component-System).
      </li><li>Explicamos desde 0 cómo se estructura una aplicación siguiendo el modelo ECS y qué siginifican los distintos componentes.
      </li><li>Resolvemos dudas respecto al planteamiento del modelo y casos concretos.
      </li><li>Hablamos de las diferencias entre ECS y el modelo de Componentes de Unity3D y Unreal Engine: no son el mismo modelo
      </li>
    </ul>
    <li>Migración a ECS</li>
    <ul>
      <li>Intentamos migrar el código a Entity-Component-System
      </li><li>Vemos y analizamos las dificultades que surgen y lo que eso significa respecto a lo acoplado que estaba nuestro código anterior
      </li><li>Intentamos desacoplar el movimiento del jugador del código que pinta, comprueba colisiones y realiza ataques a otros personajes
      </li><li>Pese a intentarlo, se nos complica tanto que ni siquiera podemos llegar a probar lo que desarrollamos.
      </li><li>Con este ejemplo entendemos lo importante que es separar las responsabilidades y que cada sistema haga exclusivamente sus funciones sin acoplarse a lo que hace el resto del código.
      </li><li>Esto nos dejaver las ventajas de tener los sistemas separados a la hora de desarrollar nuestro juego.
      </li>
    </ul>
    <li>C:</li>
    <ul>
      <li>Explicamos el funcionamiento de los includes y su utilidad a la hora de tener cosas definidas en varios ficheros.
      </li><li>Entendemos la diferencia real entre ficheros de cabecera (.H) y unidades de traducción (.C): se trata de una convención útil
      </li><li>Empezamos a separar el código que tenemos en C en varios ficheros para poder tenerlo organizado.
      </li><li>Esto nos permitirá en el futuro modelo ECS tener todos los sistemas bien separados y organizados.
      </li><li>Vemos la diferencia entre usar comillas y mayor/menor a la hora de incluir ficheros.
      </li><li>Entendemos que el proceso de compilación se ocupa de ficheros uno a uno, por separado. Ningún fichero conoce lo que hay en los demás ficheros. Para eso utilizamos las declaraciones añadidas en los ficheros de cabecera.
      </li><li>Incidimos en la diferencia entre declaraciones y definiciones y su importancia.
      </li><li>Vemos el uso de extern para poder declarar variables sin definirlas.
      </li><li>Explicamos cómo usar include guards en C para evitar que un fichero de cabecera sea procesado más de una vez allá donde es incluído.
      </li>
    </ul>
  </ul>
</ul>
</details>


## EPISODIO 4: Especial Gráficos UDG [#AGC04](https://twitter.com/hashtag/AGC04)

<a href="https://www.youtube.com/watch?v=Ru-5L9sABVU"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc04_gamesprites_thumb.png" alt="Amstrad GameDev Challenge: BASIC vs C. Episodio 4. Especial Gráficos UDG. #AGC04"/></a>
**Fecha**: Martes, 27 de agosto de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=Ru-5L9sABVU)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/agc04.zip)
|| [**>> UDG Designer <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/tools/UDGs/UDGs_designer.ods?raw=true)
<br/><br/><br/>

<details><summary><strong>&gt;&gt;&gt; Contenidos detallados &lt;&lt;&lt;</strong></summary>
<ul>
  <li><b>Noticias</b>:</li>
  <ul>
    <li><a href="http://bit.ly/premiosMadrid2019">4ª edición de los premios de animación de la comunidad de Madrid</a>, con premios de 2000€ y 1000€ a los mejores videojuegos culturales.
    </li><li>Actualizaciones de CPCtelera</li>
      <ul>
        <li>cpct_rvm ahora soporta uso de nombres largos y modo warp en arranque.
        </li><li>cpc2cdt permite importar ficheros ASCII en CDTs.
        </li><li>cpct_pack permite la generación de ficheros binarios comprimidos.
        </li><li>cpct_bin2sna permite crear snapshots de múltiples ficheros binarios.
        </li>
      </ul>
    <li>Nueva versión del emulador <a href="http://cngsoft.no-ip.org/cpcec-20190817.zip">CPCEC de CNGSoft</a>. Funciona en Windows y en Linux/Mac (con wine).
    </li>
  </ul>
  </li><li><b>Desarrollo</b>:</li>
  <ul>
    <li>BASIC:</li>
    <ul>
      <li>Repaso del código BASIC: uso de fre("") y UNT()
      </li><li>Reestructuración del código de gestión de enemigos y personaje principal
      </li><li>Descarga directa y uso en línea de comando de la última versión del emulador de CNGSoft CPCEC (wget http://cngsoft.no-ip.org/cpcec-20190817.zip)
      </li><li>Sustitución de mensajes por gráficos: usando subrutinas de dibujado para personaje y enemigos
      </li><li>Uso de variables temporales para acortar el código y mejorar su legibilidad
      </li><li>Introducción a los gráficos UDG: ¿Qué son? ¿Cómo se crean? Definición y uso de distinas bases numéricas. 
      </li><li>Uso de SYMBOL y SYMBOL AFTER.
      </li><li>¿Por qué es necesario SYMBOL AFTER? Uso de memoria de los UDGs. Modificación a mano de la memoria que define los UDGs.
      </li><li>Presentación de <a href="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/tools/UDGs/UDGs_designer.ods?raw=true">hoja de cálculo para dibujado de UDGs</a>.
      </li><li>Soporte para que los enemigos puedan tener sus propios UDGs
      </li><li><a href="http://bit.ly/fremosUDG">Más información sobre gráficos UDG en el blog de Fremos</a>.
      </li><li>Dibujado de sprites formados por múltiples caracteres y con varios colores: uso del modo transparente.
      </li><li>Dibujando sprites multicolor y multicarácter usando cadenas y códigos de control: String Sprites
      </li><li>Definición de String Sprites constantes en un array, accesibles por su índice: evitando copiar cadenas en tiempo de ejecución.
      </li><li>Activación/Desactivación de modo transaparente usando cadenas y el código de control 22
      </li>
    </ul>
    <li>C:</li>
  <ul>
    <li>Problemas de SYMBOL AFTER en C:</li>
    <ul> 
      <li>No hay SYMBOL AFTER en C ni en el firmware de Amstrad.
      </li><li>En C se generan binarios, y al cargar un binario Amstrad desactiva los UDGs.
      </li>
    </ul>
    <li>El firmware almacena 3 variables en memoria para gestionar los UDG: Valor ASCII del primer UDG definible, Puntero a la matriz de UDGs y flag de activación.
    </li><li> Las variables están en ubicaciones distintas en los firmwares 1.0 y 1.1.
    </li><li> Implementación de SYMBOL AFTER en C.
    </li><li> Detalle sobre el casting de direcciones de memoria absolutas a punteros.
    </li><li> Implementación de SYMBOL en C usando el código de control 25.
    </li><li> Entendiendo HIMEM, el firmware y la ROM, para saber dónde ubicar la tabla de definiciones de UDG para C.
    </li><li> Problema: realizar un SYMBOL AFTER antes de la inicialización de texto y gráficos con los CALL 0xBBFF y call 0xBB4E (initMode()). Estas inicializaciones deshacen el SYMBOL AFTER.  
    </li><li> Detección de la versión del firmware actualmente en ejecución: Usando el final de la tabla de saltos (High jump-block) que es distinto en las 2 versiones.
    </li><li> Problema en SDCC con múltiples comparaciones en una misma línea.
    </li><li> Definición de múltiples caracteres en C sin usar SYMBOL: haciendo que el puntero de SYMBOL AFTER apunte a un array con los datos.       
    </li><li> Imprimiendo sprites de enemigos formados de varios carácteres.
    </li><li> Creación manual de string sprites en arrays para dibujar enemigos multicaracter y multicolor.
    </li><li> Dibujando enemigos con 2 caracteres de altura, 3 colores y 9 UDGs en total.
    </li><li> Uso del modo transparencia con una función de activación/desactivación.
    </li>
  </ul>
  </li><li><b>Nuevos misterios y trabajo para casa</b>:</li>
  <ul>
    <li>Nuevo problema de memory leak en BASIC: en cada nueva ejecución del juego desaparecen 48 bytes. ¿Por qué?
    </li><li>Los UDG en BASIC nos ocupan doble: el código que genera los datos de los UDG, más los propios datos de los UDG.
    </li><li>¿Es posible tener en BASIC en memoria sólo los datos de los UDG, sin el código que los genera, como en C?
    </li>
  </ul>
</ul>
</details>

## AVANCE EPISODIO 4: Misterio Memory Leak en BASIC

<a href="https://www.youtube.com/watch?v=dFCRWeQMxu4"><img align="left" src="https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/scrshots/agc04_memoryleak_game_thumb.png" alt="Avance Amstrad GameDev Challenge: #TeamBASIC misterio memory leak"/></a>

**Fecha**: Martes, 20 de agosto de 2019, 21:00h

[**>> Vídeo <<**](https://www.youtube.com/watch?v=dFCRWeQMxu4)

[**>> Código fuente <<**](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/archive/%23AGC04-adv01.zip)
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

- [Hoja de cálculo para diseño de UDGs](https://github.com/AmstradGameDevChallenge/BASICvsC-RPG/blob/master/materials/tools/UDGs/UDGs_designer.ods?raw=true)
- [Solicitud de inscripción a la organización de Github](http://bit.ly/AGC01)
- [CPCtelera](http://lronaldo.github.io/cpctelera/)
- [CPCtelera 1.5 WIP](https://github.com/lronaldo/cpctelera/tree/development)
- [CPCtelera Manual de Referencia](http://lronaldo.github.io/cpctelera/files/readme-txt.html)
- [Manual del usuario de Amstrad CPC 464 1987](https://archive.org/details/Amstrad_CPC464_Manual_del_Usuario_1987_Amstrad_ES_a)
- [Manual del firmware del Amstrad CPC](http://www.cantrell.org.uk/david/tech/cpc/cpc-firmware/)

Cread vuestros repositorios en [AmstradGameDevChallenge](https://github.com/AmstradGameDevChallenge/) y empezad vuestros propios RPG en BASIC y C. En el próximo episodio los analizaremos en directo y compartiremos las ideas de programación entre todos.
