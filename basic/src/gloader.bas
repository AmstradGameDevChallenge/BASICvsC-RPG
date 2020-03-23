1 '==========================================
1 '==========================================
1 '== INITIALIZER ROUTINES
1 '==========================================
1 '==========================================
1 ' 
1 '=============================================
1 ' INITIALIZE
1 '=============================================
1 ' 0xBBFF: SCR INITIALIZE
1 ' 0xBB4E: TXT INITIALIZE
60000 SYMBOL AFTER 256:CALL &BBFF:CALL &BB4E
60010 SYMBOL AFTER 237:DEFINT a-z
1 ' Temporary variables
60030 f=0:i=f:j=f:k=f:a$=""
1 ' Enemy structure definition
60040 eem=4:een=0
60050 i=eem
60060 DIM ex(i),ey(i),epx(i),epy(i),evx(i),evy(i)
60070 DIM ew(i),eh(i),es(i)
60080 DIM ea(i),ed(i),ee(i),ef(i)
1 ' Maps
60085 PRINT "LOADING MAPS..."
60090 ms=1:mm=2:mc=f
60100 DIM m(399,mm-1):f=@m(0,0)
60110 FOR i=0TO mm-1
60120 FOR k=0TO 19:READ a$
60130 FOR j=0TO 39
1 '60140 m(j,k,i)=ASC(MID$(a$,j+1,1))
60140 POKE f,ASC(MID$(a$,j+1,1)):f=f+1
60150 NEXT:NEXT:NEXT

1 '
1 ' USER DEFINED GRAPHICS
1 ' Main Character
60210 SYMBOL 255,3,7,7,7,3,1,3,7
60211 SYMBOL 254,128,192,32,224,224,225,194,212
60212 SYMBOL 253,11,7,3,3,2,62,32,0
60213 SYMBOL 252,232,148,128,224,48,16,16,24
1 ' WALL BLOCK 2-colours
60214 SYMBOL 251,126,131,131,131,131,131,255,126
60215 SYMBOL 250,0,124,96,64,64,68,0,0
1 ' ENEMY 
60216 SYMBOL 249,7,13,11,15,4,15,71,179
60217 SYMBOL 248,224,176,208,240,32,240,226,204
60218 SYMBOL 247,12,47,87,7,35,67,103,159
60219 SYMBOL 246,48,244,236,224,193,197,234,241
1 ' DOOR
60220 SYMBOL 245,&1F,&3F,&70,&61,&63,&67,&67,&65
60221 SYMBOL 244,&F8,&3C,&FE,&F6,&B6,&B6,&B6,&B6
60222 SYMBOL 243,&65,&65,&65,&65,&F5,&05,&05,&06
60223 SYMBOL 242,&B6,&B6,&B6,&B6,&B7,&B8,&C0,&00
1 ' ENEMY BAT
60224 SYMBOL 241,&00,&00,&00,&10,&32,&71,&7B,&7F
60225 SYMBOL 240,&00,&00,&00,&08,&4C,&8E,&DE,&FE
60226 SYMBOL 239,&4B,&61,&21,&00,&00,&01,&07,&01
60227 SYMBOL 238,&D2,&86,&84,&00,&00,&80,&E0,&80
1 ' WALL BLOCK 
60228 SYMBOL 237,&40,&A0,&0A,&1D,&54,&22,&48,&14
1 '
1 ' DEFINE STRING SPRITES
1 ' Transparency ON&OFF
60270 ton$=chr$(22)+chr$(1)
60275 tof$=chr$(22)+chr$(0)
1 ' Main Character
60280 s$(0)=chr$(15)+chr$(1)+chr$(255)+chr$(254)+chr$(8)+chr$(8)+chr$(10)+chr$(253)+chr$(252)+chr$(11)
1 ' Regular Enemy (2 colours)
60281 s$(1)=chr$(15)+chr$(2)+chr$(249)+chr$(248)+chr$(8)+chr$(8)+chr$(10)+chr$(247)+chr$(246)+chr$(11)
60282 s$(2)=chr$(15)+chr$(3)+chr$(249)+chr$(248)+chr$(8)+chr$(8)+chr$(10)+chr$(247)+chr$(246)+chr$(11)
1 ' WALL BLOCK
1 ' 60283 s$(3)=chr$(15)+chr$(1)+chr$(251)+chr$(8)+chr$(15)+chr$(2)+chr$(250)
60283 s$(3)=chr$(15)+chr$(2)+chr$(237)
1 ' SPRITE USED TO CLEAN
60284 s$(4)=chr$(15)+chr$(1)+chr$(32)+chr$(32)+chr$(8)+chr$(8)+chr$(10)+chr$(32)+chr$(32)+chr$(11)
1 ' ENEMY BAT
60285 s$(5)=chr$(15)+chr$(2)+chr$(241)+chr$(240)+chr$(8)+chr$(8)+chr$(10)+chr$(239)+chr$(238)+chr$(11)
1 ' DOOR
60286 s$(6)=chr$(15)+chr$(1)+chr$(245)+chr$(244)+chr$(8)+chr$(8)+chr$(10)+chr$(243)+chr$(242)+chr$(11)
1 ' Bat Enemy
1 '
1 ' LOAD GAME
1 ' 
60310 PRINT "LOADING GAME. PLEASE WAIT..."
60320 CHAIN MERGE"!GAME.BAS",10,DELETE
1 '
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
1 '--Maps and Levels
1 ' m(x,y,m): Map definitions width, height, map number
1 ' ms: map selected
1 ' mm: maximum map number
1 ' mc: map changed (flag indicated map has changed)
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
1 ' LEVELS
1 ' Level 1
60400 DATA ########################################
60401 DATA #                                      #
60402 DATA #                                      #
60403 DATA #   ################################   #
60404 DATA #   ################################   #
60405 DATA #   ##                            ##   #
60406 DATA #   ##                            ##   #
60407 DATA #   ##  ########################  ##   #
60408 DATA #   ##  ########################  ##   #
60409 DATA #   ##  ##                        ##   #
60410 DATA #   ##  ##                        ##   #
60411 DATA #       ##  ########################   #
60412 DATA #       ##  ########################   #
60413 DATA #   ##  ##                        ##   #
60414 DATA #   ##  ##                        ##   #
60415 DATA #   ##  ############################   #
60416 DATA #   ##  ############################   #
60417 DATA #   ##                            ##   #
60418 DATA #   ##                            ##   #
60419 DATA ########################################
1 '
1 ' Level 2
60420 DATA ########################################
60421 DATA #                                      #
60422 DATA #                                      #
60423 DATA #                                      #
60424 DATA #                                      #
60425 DATA #    #############################     #
60426 DATA #    #############################     #
60427 DATA #    ##                         ##     #
60428 DATA #    ##                         ##     #
60429 DATA #    ##                         ##     #
60430 DATA #    ##                         ##     #
60431 DATA #    ##                         ##     #
60432 DATA #    ############   ##############     #
60433 DATA #    ############   ##############     #
60434 DATA #                                      #
60435 DATA #                                      #
60436 DATA #                                      #
60437 DATA #                                      #
60438 DATA #                                      #
60439 DATA ########################################