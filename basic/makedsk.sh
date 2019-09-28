#!/bin/bash
IDSK=$CPCT_PATH/tools/iDSK-0.13/bin/iDSK
SRC=src
OBJ=obj
TARGET=agcrpg.dsk

# Create DSK
$IDSK ${TARGET} -n

# Remove comments
grep -v "^1 '" ${SRC}/loader.bas > ${OBJ}/agcrpg.bas
grep -v "^1 '" ${SRC}/rpg.bas    > ${OBJ}/game.bas

# CONVERT TO MSDOS and ADD to DSK
for FILE in ${OBJ}/*; do
   unix2dos $FILE
   $IDSK ${TARGET} -i $FILE -t 0
done

# REMOVE OBJECTS
rm ./${OBJ}/*