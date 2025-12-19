1 '=====
1 '== Init all variables and entities
1 '=====
1 ' 0xBBFF: SCR INIT
1 ' 0xBB4E: TXT INIT
65000 SYMBOL AFTER 256:CALL &BBFF:CALL &BB4E
65010 MODE 0:BORDER 13:INK 1,24:INK 3,6
65020 DEFINT a-z:DIM s$(10)
1 ' Runner
65030 x=4:vx=0:y=10:px=4:py=10
65040 s$(0)=chr$(15)+chr$(1)+chr$(254)
1 ' Cactus
65050 cx=20:cy=10:pcx=20:pcy=10
65060 s$(1)=chr$(15)+chr$(3)+chr$(240)

65500 RETURN