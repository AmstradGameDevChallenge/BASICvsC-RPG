#!/bin/bash
CPC2CDT=$CPCT_PATH/tools/cpc2cdt/bin/cpc2cdt
SRC=src
OBJ=obj
BIN=bin
TARGET=agcrpg.cdt

# Remove comments
grep -v "^1 '" ${SRC}/loader.bas       > ${OBJ}/loader.bas
grep -v "^1 '" ${SRC}/gameloader.bas   > ${OBJ}/agcrpg.bas
grep -v "^1 '" ${SRC}/rpg.bas          > ${OBJ}/game.bas

# CONVERT TO MSDOS and ADD to DSK
for FILE in ${OBJ}/*; do
   unix2dos $FILE
done

# IMAGE CONVERSIONS
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen01.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen02.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen03.png 
cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen04.png 
mv ./assets/*.bin bin/
rm ./assets/*.h
rm ./assets/*.h.s

# CREATE AND ADD TO CDT
rm -f ./${TARGET}
$CPC2CDT -t -b 2000 -m cpctxt -r "DUNGEON CASTLE"  ${OBJ}/loader.bas    ${TARGET}
$CPC2CDT -t -b 2000 -m cpc    -r "SCREEN01.BIN"    ${BIN}/screen01.bin  ${TARGET}
$CPC2CDT -t -b 2000 -m cpc    -r "SCREEN02.BIN"    ${BIN}/screen02.bin  ${TARGET}
$CPC2CDT -t -b 2000 -m cpc    -r "SCREEN03.BIN"    ${BIN}/screen03.bin  ${TARGET}
$CPC2CDT -t -b 2000 -m cpc    -r "SCREEN04.BIN"    ${BIN}/screen04.bin  ${TARGET}
$CPC2CDT -t -b 2000 -m cpctxt -r "GL.BAS"          ${OBJ}/agcrpg.bas    ${TARGET}
$CPC2CDT -t -b 2000 -m cpctxt -r "GAME.BAS"        ${OBJ}/game.bas      ${TARGET}

# REMOVE OBJECTS
rm ./${OBJ}/*
rm ./${BIN}/*