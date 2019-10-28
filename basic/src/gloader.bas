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
1 ' Temporary variables
60030 f=0:i=f:j=f:k=f:a$=""
1 ' Enemy structure definition
60040 eem=3:een=0
60050 i=eem
60060 DIM ex(i),ey(i),evx(i),evy(i)
60070 DIM ew(i),eh(i),es(i)
60080 DIM ea(i),ed(i),ee(i),ef(i)

1 ' USER DEFINED GRAPHICS
60110 SYMBOL 255,1,3,7,15,31,63,127,255
60120 SYMBOL 254,128,192,224,240,248,252,254,255
60130 SYMBOL 253,255,127,63,31,15,7,3,1
60140 SYMBOL 252,255,254,252,248,240,224,192,128

1 ' DEFINE STRING SPRITES
60170 s$(0)=chr$(15)+chr$(1)+chr$(255)+chr$(254)+chr$(8)+chr$(8)+chr$(10)+chr$(253)+chr$(252)+chr$(11)
60180 s$(1)=chr$(15)+chr$(2)+chr$(255)+chr$(254)+chr$(8)+chr$(8)+chr$(10)+chr$(253)+chr$(252)+chr$(11)
60190 s$(2)=chr$(15)+chr$(3)+chr$(255)+chr$(254)+chr$(8)+chr$(8)+chr$(10)+chr$(253)+chr$(252)+chr$(11)
60200 ton$=chr$(22)+chr$(1)
60210 tof$=chr$(22)+chr$(0)
60220 PRINT "LOADING GAME. PLEASE WAIT..."
60230 CHAIN MERGE"!GAME.BAS",10,DELETE

1 '=============================================
1 '--Index temporary variables:
1 ' i, j, k
1 '--Entity Attributes (e prefix):
1 ' Position
1 ' ex(): entity x-coord
1 ' ey(): entity y-coord
1 ' Physics
1 ' evx(): entity x-velocity
1 ' evy(): entity y-velocity
1 ' Render
1 ' ew(): entity width
1 ' eh(): entity height
1 ' es(): entity sprite number
1 ' RPG 
1 ' ea(): entity attack
1 ' ed(): entity defense
1 ' ee(): entity energy
1 ' ef(): entity force
1 '--Entity General Control(ee prefix):
1 ' eem: Entity Max Number
1 ' een: Entity number
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
