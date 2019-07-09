10 '  
20 ' MY BIG RPG PROJECT
30 ' by @FranGallegoBR
40 ' July 2019
50 '

100 ' INITIALIZE
110 DEFINT a-z
120 energy=100:attack=30:defense=15
130 energyen=90:attacken=20:defenseen=10:a$=""

200 ' PRESENTATION
210 MODE 1:PRINT"RPG GAME"
220 PRINT"PRESS ENTER TO START"
230 INPUT"",a$

300 ' PRINT GAME STATUS
310 CLS
320 PRINT"PLAYER ["energy"](a"attack")(d"defense")"
330 PRINT"ENEMY  ["energyen"](a"attacken")(d"defenseen")"

400 ' PLAYER ACTIONS
410 INPUT"ACTION";a$
420 IF a$="A" THEN energyen=energyen-attack:GOTO 500
430 IF a$="D" THEN energy=energy+defense:GOTO 500
440 GOTO 400

500 ' ENEMY ACTIONS
510 IF RND>0.25 THEN energy=energy-attacken:GOTO 300
520 energyen=energyen+defenseen:GOTO 300
