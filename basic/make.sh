#!/bin/bash
#
# Script configuration
#
SCRIPTCMD=$(basename $0)
CPC2CDT=$CPCT_PATH/tools/cpc2cdt/bin/cpc2cdt
IDSK=$CPCT_PATH/tools/iDSK-0.13/bin/iDSK
COMMENTS="^1 *'"
SRC=src
OBJ=obj
BIN=bin
TARGET_CDT=dcastles.cdt
TARGET_DSK=dcastles.dsk

#--------------------------------------------------------------------------
# Shows script help and exits
#
function help() {
   cat <<EndOfHelpMessage

 Usage: 
   ${SCRIPTCMD} {DSK/CDT/Clean}

   Generates a DSK or CDT file from the BAS files in source folder and Images 
 in assets folder.

   On Clean parameter, it cleans up all previously produced object files.

EndOfHelpMessage
   
   exit 1
}

#--------------------------------------------------------------------------
# Prepares all BAS Source files to be included into CDT or DSK
#  - Removes comments
#  - Converts files to DOS CRLF format
#  - Moves them to OBJ folder respecting folder structure
#
function prepareAllBasSourceFiles() {
   # Local variables
   local BASFILE_SRCDIR
   local BASFILE_OBJDIR
   local OBJBASFILE
   local BASFILE
   local SRCFILES

   # List all BAS files in SOURCE folder
   IFS=$'\n'
   SRCFILES=$(find "./${SRC}" -iname *.bas -type f)
   
   # Remove comments from files and put them on OBJ folder
   for BASFILE in ${SRCFILES[*]}; do
      # Get directory of the file and make same dir in OBJ
      BASFILE_SRCDIR=$(dirname "$BASFILE")
      BASFILE_OBJDIR=${BASFILE_SRCDIR/${SRC}/${OBJ}}
      OBJBASFILE=${BASFILE/${SRC}/${OBJ}}
      mkdir -p "${BASFILE_OBJDIR}"
   
      # Remove comments in file and put result into OBJ dir
      # Also convert OBJ BASFILE to DOS CRLF format
      grep -v "$COMMENTS" ${BASFILE} > ${OBJBASFILE}
      unix2dos ${OBJBASFILE}
   done

   # List all BAS files in OBJ/game folder
   IFS=$'\n'
   SRCFILES=$(find "./${OBJ}/game" -iname *.bas -type f)
   echo "" > ./${OBJ}/game.bas

   # Remove comments from files and put them on OBJ folder
   for BASFILE in ${SRCFILES[*]}; do
      cat "${BASFILE}" >> ./${OBJ}/game.bas
      rm "${BASFILE}"
   done
}

#--------------------------------------------------------------------------
# Converts all images in assets folder as required
#
function convertAllImages () {
   # CREATE BIN FOLDER IF IT DOES NOT EXIST
   mkdir -p ./${BIN}/

   # IMAGE CONVERSIONS
   cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen01.png 
   cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen02.png 
   cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen03.png 
   cpct_img2tileset -tw 160 -th 200 -scr -of bin -nt assets/screen04.png 
   mv ./assets/*.bin ./${BIN}/
   rm ./assets/*.h
   rm ./assets/*.h.s
}

#--------------------------------------------------------------------------
# Adds a single file to the ${TARGET_CDT}
# $1: Type of the file (cpctxt, cpc...)
# $2: Long filename (Up to 16 chars, it will be shown on tape loading)
# $3: Filename      (File that is to be added)
#
function add2CDT() {
   local TYPE="$1"
   local TAPENAME="$2"
   local FILENAME="$3"

   $CPC2CDT -t -b 2000 -m "$TYPE" -r "$TAPENAME" "$FILENAME" "$TARGET_CDT"
}

#--------------------------------------------------------------------------
# Adds a single file to the ${TARGET_DSK}
# $1: Type of the file  (0, 1)
# $2: Filename          (File that is to be added)
#
function add2DSK() {
   local TYPE="$1"
   local FILENAME="$2"

   $IDSK "$TARGET_DSK" -i "$FILENAME" -t "$TYPE"
}

#--------------------------------------------------------------------------
# Creates the CDT File adding required files in order
#
function createCDT() {
   # Creates the CDT from scratch (removing previous one)
   # and adds all files in their required order
   rm -f ./${TARGET_CDT}
   add2CDT cpctxt "DUNGEON CASTLES" ${OBJ}/dcastles.bas     
   add2CDT cpc    "SCREEN01.BIN"    ${BIN}/screen01.bin
   add2CDT cpc    "SCREEN02.BIN"    ${BIN}/screen02.bin
   add2CDT cpc    "SCREEN03.BIN"    ${BIN}/screen03.bin
   add2CDT cpc    "SCREEN04.BIN"    ${BIN}/screen04.bin
   add2CDT cpctxt "GLOADER.BAS"     ${OBJ}/gloader.bas
   add2CDT cpc    "LEVELS.BIN"      ${BIN}/levels.bin
   add2CDT cpctxt "GAME.BAS"        ${OBJ}/game.bas
}

#--------------------------------------------------------------------------
# Converts all tilemaps in assets/levels into binary as required
#
function convertAllMaps () {
   # CREATE BIN FOLDER IF IT DOES NOT EXIST
   mkdir -p ./${BIN}/levels/

   # IMAGE CONVERSIONS
   for TMX in assets/levels/*tmx; do
      cpct_tmx2data "${TMX}" -gb -ba 1 -of ./${BIN}/levels/
   done

   # CONCAT LEVELS
   cat ./${BIN}/levels/*.bin > ./${BIN}/levels.bin
   rm ./${BIN}/levels/*.bin
}

#--------------------------------------------------------------------------
# Creates the DSK file adding required files
#
function createDSK() {
   # Local variables
   local OBJFILES
   local FILE

   # create a new DSK
   $IDSK "${TARGET_DSK}" -n 

   # List all BAS files in OBJECT folder
   # And add them to the DSK one by one 
   # As type 0 (BASIC/Text)
   IFS=$'\n'
   OBJFILES=$(find "./${OBJ}" -iname *.bas -type f)
   for FILE in ${OBJFILES[*]}; do
      add2DSK 0 "$FILE"
   done
   
   # List all BINARY files in OBJECT folder
   # And add them to the DSK one by one 
   # As type 1 (Binary)
   IFS=$'\n'
   OBJFILES=$(find "./${BIN}" -iname *.bin -type f)
   for FILE in ${OBJFILES[*]}; do
      add2DSK 1 "$FILE"
   done
}

#--------------------------------------------------------------------------
# Removes all generated compilation objects
# except CDT and DSK generated
#
function cleanObjects() {
   # REMOVE OBJECTS
   rm -rf ./${OBJ}/
   rm -rf ./${BIN}/
}

########################################################################
########################################################################
## SCRIPT MAIN
########################################################################
########################################################################

## Check parameter number
if (( $# != 1 )); then
   help
fi

## Check parameter
PARAM=${1^^}   ## Uppercase
case "$PARAM" in
   "CDT") 
      prepareAllBasSourceFiles
      convertAllImages
      convertAllMaps
      createCDT
   ;;
   "DSK") 
      prepareAllBasSourceFiles
      convertAllImages
      convertAllMaps
      createDSK
   ;;
   "CLEAN")
      cleanObjects
   ;;
   *) echo "ERROR: Parameter '${PARAM}' not valid"
   help
   ;;
esac
