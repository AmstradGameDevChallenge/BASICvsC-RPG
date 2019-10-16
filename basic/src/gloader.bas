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
60000 SYMBOL AFTER 256:CALL &BBFF:CALL &BB4E
60010 SYMBOL AFTER 250:DEFINT a-z
60020 e=100:a=30:c=250:d=15:x=5:v=0
1 ' Temporary variables
60030 f=0:i=f:j=f:k=f:a$=""
1 ' Enemy structure definition
60040 eem=3:eet=0:een=0
60050 i=eem
60060 DIM ea(i),ed(i),ee(i),ev(i)
60070 DIM en(i),ep(i),es(i),ex(i)
60080 DIM m(3):m(0)=-1:m(1)=1:m(2)=1:m(3)=-1

1 ' USER DEFINED GRAPHICS
1 ' 60100 SYMBOL AFTER 250
1 ' 60110 SYMBOL 250,&3C,&42,&EA,&FE,&DF,&46,&3C,&66
1 ' 60120 SYMBOL 251,&9C,&48,&34,&FE,&FE,&3C,&54,&94
1 ' 60130 SYMBOL 252,&24,&99,&DB,&E7,&3C,&3C,&24,&66
1 ' 60140 SYMBOL 253,&3E,&22,&E2,&7E,&2A,&FF,&81,&FF
1 ' 60200 RETURN

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
60220 PRINT "LOADING GAME. PLEASE WAIT..."
60230 CHAIN MERGE"!GAME.BAS",10,DELETE

1 '=============================================
1 '--Index temporary variables:
1 ' i, j, k
1 '--Player Attributes:
1 ' a: attack
1 ' c: player character number
1 ' d: defense
1 ' e: energy
1 ' x: x-coord
1 ' v: velocity in x-axis
1 '--Enemy Attributes (e prefix):
1 ' ea(): enemy attack
1 ' ed(): enemy defense
1 ' ee(): enemy energy
1 ' en(): enemy move status
1 ' ep(): enemy pen
1 ' es(): enemy sprite number
1 ' ex(): enemy x-coord
1 ' ev(): enemy velocity in x-axis
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
