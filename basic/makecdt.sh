#!/bin/bash
CPC2CDT=$CPCT_PATH/tools/cpc2cdt/bin/cpc2cdt
SRC=src
OBJ=obj
TARGET=agcrpg.cdt

# Remove comments
grep -v "^1 '" ${SRC}/loader.bas > ${OBJ}/agcrpg.bas
grep -v "^1 '" ${SRC}/rpg.bas    > ${OBJ}/game.bas

# CONVERT TO MSDOS and ADD to DSK
for FILE in ${OBJ}/*; do
   unix2dos $FILE
done

# CREATE AND ADD TO CDT
$CPC2CDT -t -b 2000 -m cpctxt -r "DUNGEON CASTLES" ${OBJ}/agcrpg.bas  ${TARGET}
$CPC2CDT -t -b 2000 -m cpctxt -r "GAME.BAS"        ${OBJ}/game.bas    ${TARGET}

# REMOVE OBJECTS
rm ./${OBJ}/*