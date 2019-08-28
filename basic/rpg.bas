1 '  
1 ' MY BIG RPG PROJECT
1 ' by @FranGallegoBR
1 ' July 2019
1 '

1 ' INITIALIZE
100 GOSUB 60000

1 ' PRESENTATION
200 PRINT"RPG GAME"
210 GOSUB 10000:RANDOMIZE TIME

1 ' Create enemies
250 GOSUB 3000:GOSUB 3000:GOSUB 3000

1 ' ========================================================
1 ' ========================================================
1 ' === MAIN GAME LOOP 
1 ' ========================================================
1 ' ========================================================

1 ' PRINT GAME STATUS
300 WHILE 1:CLS
1 ' RENDER PLAYER
310 GOSUB 1200
1 ' RENDER ENEMIES
330 FOR eet=0TO een-1
340 GOSUB 3200
1 ' PATCH! eet=0
350 NEXT:eet=0
1 ' DRAW FLOOR
360 LOCATE 1,7:PEN 1
370 PRINT STRING$(20,143):PRINT STRING$(20,127)

1 ' PLAYER ACTIONS
400 INPUT"ACTION";a$
410 IF a$="O" THEN GOSUB 1000:GOTO 500
420 IF a$="P" THEN GOSUB 1100:GOTO 500
430 IF a$="D" THEN GOSUB 1400:GOTO 500
450 GOTO 400

1 ' ENEMY ACTIONS: ATTACK or MOVE
500 FOR eet=0TO een-1
510 GOSUB 3300
520 NEXT

900 GOSUB 10000
910 i=UNT(fre(""))
920 WEND

1 ' ========================================================
1 ' ========================================================

1 '==========================================
1 '==========================================
1 '== PLAYER ROUTINES
1 '==========================================
1 '==========================================

1 ' MOVE PLAYER LEFT
1000 x=x-1:IF x=0THEN x=1
1010 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' MOVE PLAYER RIGHT
1 ''''''''''''''''''''''''''''''''
1 '
1100 x=x+1:IF x=ex(eet)THEN x=x-1:GOSUB 1300
1110 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' RENDER PLAYER
1 ''''''''''''''''''''''''''''''''
1 '
1200 GOSUB 1250:PRINT"["e"](a"a")(d"d")"
1210 LOCATE x,6:GOSUB 1250
1220 RETURN
1 ' RENDER PLAYER CHARACTER ONLY
1250 PEN 1:PRINT CHR$(250);
1260 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' PLAYER ATTACKS ENEMY 'eet'
1 ''''''''''''''''''''''''''''''''
1 '
1300 i=eet
1310 f=FNr(a):ee(i)=ee(i)-f
1320 GOSUB 1250:PEN 2:PRINT" >";-f"> ";:GOSUB 3250:PRINT
1330 RETURN

1 ' PLAYER DEFENDS
1400 f=FNr(d):e=e+f:GOSUB 1250:PEN 2:PRINT"++"f
1410 RETURN

1 '==========================================
1 '==========================================
1 '== ENEMY ROUTINES
1 '==========================================
1 '==========================================

1 ''''''''''''''''''''''''''''''''
1 '' CREATE NEW ENEMY
1 ''''''''''''''''''''''''''''''''
1 '
1 ' Is there space for new enemies?
3000 IF een=eem THEN RETURN
1 ' Initialize Enemy number 'een'
3010 i=een
3020 ee(i)=90:ea(i)=20:es(i)=i:ed(i)=10
3030 ex(i)=7+i*2:en(i)=0:ep(i)=i+1
3040 een=i+1
3050 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' DESTROY ENEMY
1 ''''''''''''''''''''''''''''''''
1 '
1 '     eet     een       
1 '| 0 | 1 | 2 | 3 |....| eem |
3100 een=een-1:IF eet=een THEN RETURN
1 ' Copy enemy 'een' over enemy 'eet'
3110 i=eet:k=een
3120 ee(i)=ee(k):ea(i)=ea(k):ep(i)=ep(k)
3130 ed(i)=ed(k):ex(i)=ex(k):en(i)=en(k)
3140 es(i)=es(k)
3150 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' DRAW ENEMY 'eet'
1 ''''''''''''''''''''''''''''''''
1 '
3200 LOCATE 1,2+eet
3210 GOSUB 3250:PRINT"["ee(eet)"](a"ea(eet)")(d"ed(eet)")"
3220 LOCATE ex(eet),5:GOSUB 3250
3230 RETURN
1 ' SUBROUTINE FOR DRAWING ENEMY CHARACTER WITH COLOR
3250 PRINT ton$;s$(es(eet));tof$;
3260 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' ENEMY 'eet' UPDATE
1 ''''''''''''''''''''''''''''''''
1 '
3300 IF ee(eet)<=0THEN GOSUB 3250:PEN 3:PRINT" DEAD":GOSUB 3100
1 ' ENEMY ACTIONS: ATTACK or MOVE
3310 IF ex(eet)=x+1THEN GOSUB 3400 ELSE GOSUB 3500
3320 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' ENEMY 'eet' ATTACKS
1 ''''''''''''''''''''''''''''''''
1 '
3400 f=FNr(ea(eet)):e=e-f
3410 GOSUB 3250:PEN 3:PRINT" >";-f"> ";:GOSUB 1250:PRINT
3420 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' ENEMY 'eet' MOVES
1 ''''''''''''''''''''''''''''''''
1 '
3500 ex(eet)=ex(eet)+m(en(eet)):en(eet)=en(eet)+1:IF en(eet)=4THEN en(eet)=0
3510 RETURN

1 '==========================================
1 '==========================================
1 '== HELPER ROUTINES
1 '==========================================
1 '==========================================

1 ' PRESS ENTER TO CONTINUE
10000 PEN 1:PRINT"PRESS ENTER TO CONTINUE"
10010 INPUT"",a$
10020 RETURN

1 '==========================================
1 '==========================================
1 '== INITIALIZER ROUTINES
1 '==========================================
1 '==========================================

1 '=============================================
1 ' INITIALIZE
1 '=============================================
1 ' 0xBBFF: SCR INITIALIZE
1 ' 0xBB4E: TXT INITIALIZE
60000 CALL &BBFF:CALL &BB4E:DEFINT a-z
60010 e=100:a=30:c=250:d=15:x=5
1 ' Temporary variables
60020 f=0:i=f:j=f:k=f:a$=""
1 ' Enemy structure definition
60030 eem=3:eet=0:een=0
60040 i=eem
60050 DIM ea(i),ed(i),ee(i)
60060 DIM en(i),ep(i),es(i),ex(i)
60070 DIM m(3):m(0)=-1:m(1)=1:m(2)=1:m(3)=-1
60080 DEF FNr(m)=m-3+(RND*6)

1 ' USER DEFINED GRAPHICS
1 ' 60100 SYMBOL AFTER 250
1 ' 60110 SYMBOL 250,&3C,&42,&EA,&FE,&DF,&46,&3C,&66
1 ' 60120 SYMBOL 251,&9C,&48,&34,&FE,&FE,&3C,&54,&94
1 ' 60130 SYMBOL 252,&24,&99,&DB,&E7,&3C,&3C,&24,&66
1 ' 60140 SYMBOL 253,&3E,&22,&E2,&7E,&2A,&FF,&81,&FF
1 ' 60200 RETURN

60100 SYMBOL AFTER 250
60110 SYMBOL 255,&3C,&24,&38,&24,&18,&18,&26,&1C
60120 SYMBOL 254,&18,&18,&18,&3C,&3C,&66,&00,&00
60130 SYMBOL 253,&00,&00,&04,&00,&00,&80,&80,&C0
60140 SYMBOL 252,&82,&00,&00,&00,&00,&00,&66,&E7
60150 SYMBOL 251,&00,&18,&00,&18,&04,&00,&40,&22
60160 SYMBOL 250,&3C,&42,&EA,&FE,&DF,&46,&3C,&66
1 ' DEFINE STRING SPRITES
60170 s$(0)=chr$(15)+chr$(1)+chr$(255)+chr$(8)+chr$(15)+chr$(2)+chr$(253)+chr$(8)+chr$(15)+chr$(3)+chr$(251)+chr$(8)+chr$(10)+chr$(15)+chr$(1)+chr$(254)+chr$(8)+chr$(15)+chr$(2)+chr$(252)+chr$(11)
60180 s$(1)=chr$(15)+chr$(1)+chr$(255)+chr$(8)+chr$(15)+chr$(2)+chr$(253)+chr$(8)+chr$(15)+chr$(3)+chr$(251)+chr$(8)+chr$(10)+chr$(15)+chr$(1)+chr$(254)+chr$(8)+chr$(15)+chr$(2)+chr$(252)+chr$(11)
60190 s$(2)=chr$(15)+chr$(1)+chr$(255)+chr$(8)+chr$(15)+chr$(2)+chr$(253)+chr$(8)+chr$(15)+chr$(3)+chr$(251)+chr$(8)+chr$(10)+chr$(15)+chr$(1)+chr$(254)+chr$(8)+chr$(15)+chr$(2)+chr$(252)+chr$(11)
60200 ton$=chr$(22)+chr$(1)
60210 tof$=chr$(22)+chr$(0)
60220 RETURN

1 '=============================================
1 '--Index temporary variables:
1 ' i, j, k
1 '--Player Attributes:
1 ' a: attack
1 ' c: player character number
1 ' d: defense
1 ' e: energy
1 ' x: x-coord
1 '--Enemy Attributes (e prefix):
1 ' ea(): enemy attack
1 ' ed(): enemy defense
1 ' ee(): enemy energy
1 ' en(): enemy move status
1 ' ep(): enemy pen
1 ' es(): enemy sprite number
1 ' ex(): enemy x-coord
1 '--Enemy General Control(ee prefix):
1 ' eem: Enemy Max Number
1 ' eet: Enemy turn
1 ' een: Enemy number
1 '--Movements (m enemy movement)
1 ' m: enemy movement
1 '--General Variables:
1 ' f: Temporary force calculation
1 ' a$: Temporary user INPUT
1 ' s$(): Array of global sprite strings
1 ' ton$: Activate (ON) transparences string
1 ' tof$: Deactivate (OFF) transparences string
1 '--Functions:
1 ' FNr(m): Random between [m-3, m+3]
1 '=============================================
1 '
