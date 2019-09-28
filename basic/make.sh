#!/bin/bash
IDSK=$CPCT_PATH/tools/iDSK-0.13/bin/iDSK
SOURCE=rpg.bas
TARGET=agc04rpg

# Create DSK
$IDSK ${TARGET}.dsk -n

# Remove comments
grep -v "^1 '" $SOURCE > ${TARGET}.bas
grep -v "^1 '" loader.bas > loader05.bas

# CONVERT TO MSDOS
unix2dos ${TARGET}.bas
unix2dos loader05.bas

# ADD TO DSK
$IDSK ${TARGET}.dsk -i ${TARGET}.bas -t 0
$IDSK ${TARGET}.dsk -i loader05.bas -t 0