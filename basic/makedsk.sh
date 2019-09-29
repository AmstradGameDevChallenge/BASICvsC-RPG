#!/bin/bash
IDSK=$CPCT_PATH/tools/iDSK-0.13/bin/iDSK
SRC=src
OBJ=obj
BIN=bin
TARGET=agcrpg.dsk

# Create DSK
$IDSK ${TARGET} -n

# Remove comments
grep -v "^1 '" ${SRC}/loader.bas       > ${OBJ}/agcrpg.bas
grep -v "^1 '" ${SRC}/gameloader.bas   > ${OBJ}/gl.bas
grep -v "^1 '" ${SRC}/rpg.bas          > ${OBJ}/game.bas

# CONVERT TO MSDOS and ADD to DSK
for FILE in ${OBJ}/*; do
   unix2dos $FILE
   $IDSK ${TARGET} -i $FILE -t 0
done

# IMAGE CONVERSIONS
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen01.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen02.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen03.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen04.png 
mv ./assets/*.bin bin/
rm ./assets/*.h
rm ./assets/*.h.s

# ADD IMAGES TO DSK
for FILE in ${BIN}/*; do
   $IDSK ${TARGET} -i $FILE -t 1
done

# REMOVE OBJECTS
rm ./${OBJ}/*
rm ./${BIN}/*