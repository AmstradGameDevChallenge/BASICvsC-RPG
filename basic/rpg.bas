1 '  
1 ' MY BIG RPG PROJECT
1 ' by @FranGallegoBR
1 ' July 2019
1 '

1 '=============================================
1 ' INITIALIZE
1 '=============================================
1 ' 0xBBFF: SCR INITIALIZE
1 ' 0xBB4E: TXT INITIALIZE
1 '=============================================
1 '--Index temporary variables:
1 ' i, j, k
1 '--Player Attributes:
1 ' e: energy, a: attack, d: defense
1 ' x: x-coord
1 '--Enemy Attributes (e prefix):
1 ' ee: enemy energy, ea: enemy attack
1 ' ed: enemy defense, ex: enemy x-coord
1 ' en: enemy move status, ep: enemy pen
1 '--Enemy General Control(ee prefix):
1 ' eem: Enemy Max Number
1 ' eet: Enemy turn
1 ' een: Enemy number
1 '--Movements (m enemy movement)
1 ' m: enemy movement
1 '--General Variables:
1 ' f: Temporary force calculation
1 ' a$: Temporary user INPUT
1 '--Functions:
1 ' FNr(m): Random between [m-3, m+3]
1 '=============================================
1 '
100 CALL &BBFF:CALL &BB4E:DEFINT a-z
110 e=100:a=30:d=15:x=5:f=0:i=f:j=f:k=f
120 eem=3:DIM ee(eem),ea(eem),ed(eem),ex(eem),en(eem),ep(eem)
130 eet=0:een=0:a$=""
140 DIM m(3):m(0)=-1:m(1)=1:m(2)=1:m(3)=-1
150 DEF FNr(m)=m-3+(RND*6)
1 ' Create enemies
160 GOSUB 3000:GOSUB 3000:GOSUB 3000

1 ' PRESENTATION
200 PRINT"RPG GAME"
210 GOSUB 10000:RANDOMIZE TIME

1 ' ========================================================
1 ' ========================================================
1 ' === MAIN GAME LOOP 
1 ' ========================================================
1 ' ========================================================

1 ' PRINT GAME STATUS
300 WHILE 1:CLS
1 ' RENDER PLAYER
310 PRINT"PLAYER ["e"](a"a")(d"d")"
320 LOCATE x,6:PRINT CHR$(249)
1 ' RENDER ENEMIES
330 FOR eet=0TO een-1
340 GOSUB 3200
1 ' PATCH! eet=0
350 NEXT:eet=0
1 ' DRAW FLOOR
360 LOCATE 1,7:PRINT STRING$(20,143):PRINT STRING$(20,127)

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


1 ' MOVE PLAYER LEFT
1000 x=x-1:IF x=0THEN x=1
1010 RETURN

1 ' MOVE PLAYER RIGHT
1100 x=x+1:IF x=ex(eet) THEN x=x-1:f=FNr(a):ee(eet)=ee(eet)-f:PRINT"PLAYER ATTACKS WITH FORCE:"f
1110 RETURN

1 ' ENEMY ATTACKS
1200 f=FNr(ea(eet)):e=e-f:PRINT"ENEMY ";:GOSUB 3250:PRINT" ATTACKS WITH FORCE:"f
1210 RETURN

1 ' ENEMY MOVES
1300 ex(eet)=ex(eet)+m(en(eet)):en(eet)=en(eet)+1:IF en(eet)=4THEN en(eet)=0
1310 RETURN

1 ' PLAYER DEFENDS
1400 f=FNr(d):e=e+f:PRINT"PLAYER RELOADS:"f
1410 RETURN

1 '==========================================
1 '== ENEMY ROUTINES
1 '==========================================
1 '

1 ''''''''''''''''''''''''''''''''
1 '' CREATE NEW ENEMY
1 ''''''''''''''''''''''''''''''''
1 '
1 ' Is there space for new enemies?
3000 IF een=eem THEN RETURN
1 ' Initialize Enemy number 'een'
3010 ee(een)=90:ea(een)=20:ed(een)=10
3020 ex(een)=7+een*2:en(een)=0:ep(een)=een+1
3030 een=een+1
3040 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' DESTROY ENEMY
1 ''''''''''''''''''''''''''''''''
1 '
1 '     eet     een       
1 '| 0 | 1 | 2 | 3 |....| eem |
3100 een=een-1:IF eet=een THEN RETURN
1 ' Copy enemy 'een' over enemy 'eet'
3110 ee(eet)=ee(een):ea(eet)=ea(een):ep(eet)=ep(een)
3120 ed(eet)=ed(een):ex(eet)=ex(een):en(eet)=en(een)
3130 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' DRAW ENEMY 'eet'
1 ''''''''''''''''''''''''''''''''
1 '
3200 LOCATE 1,2+eet
3210 PRINT"ENEMY ";:GOSUB 3250:PRINT"["ee(eet)"](a"ea(eet)")(d"ed(eet)")"
3220 LOCATE ex(eet),6:GOSUB 3250
3230 RETURN
1 ' SUBROUTINE FOR DRAWING ENEMY CHARACTER WITH COLOR
3250 PEN ep(eet):PRINT CHR$(225);:PEN 1
3260 RETURN

1 ''''''''''''''''''''''''''''''''
1 '' ENEMY 'eet' UPDATE
1 ''''''''''''''''''''''''''''''''
1 '
3300 IF ee(eet)<=0THEN PRINT "ENEMY ";:GOSUB 3250:PRINT" KILLED":GOSUB 3100
1 ' ENEMY ACTIONS: ATTACK or MOVE
3310 IF ex(eet)=x+1THEN GOSUB 1200 ELSE GOSUB 1300
3320 RETURN


1 ' PRESS ENTER TO CONTINUE
10000 PRINT"PRESS ENTER TO CONTINUE"
10010 INPUT"",a$
10020 RETURN

1 '
