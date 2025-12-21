1 ' GCND: Google Chrome Navideño Dinosaurio
1 ' by AGC
1 '

1 ' INIT
10 GOSUB 65000
1 ' MAIN LOOP
100 WHILE die=0
1 ' UPDATE
110 GOSUB 10000
1 ' RENDER
120 GOSUB 20000
200 WEND
1 ' DIE SEQUENCE
210 LOCATE 10,12:?"YOU DIED"
220 WHILE NOT INKEY(47):WEND
230 WHILE INKEY(47):WEND
240 RUN

1 '=========================
1 '=== UPDATE
1 '=========================
1 ' Move Obstacle
10000 ox=ox+ovx
10010 IF ox<-32THEN ox=640
1 ' Move Dino
1 ' -Jump tests
10020 py=y:IF jj=1 THEN 10040
10030 IF NOT INKEY(47) THEN jj=1:vy=jvy ELSE 10200
1 ' -Jump Control
10040 y=y+vy:vy=vy-1
10050 IF y<=48 THEN y=48:vy=0:jj=0
1 ' Check Collisions
10200 d=ABS(x-ox):IF d>25 THEN 19000
10210 d=ABS(y-oy):IF d>12 THEN 19000
10220 die=1
19000 RETURN

1 '=========================
1 '=== RENDER
1 '=========================
20000 TAG
1 ' DRAW DINO
20010 IF py<>y THEN MOVE x,py:?CHR$(32);
20020 MOVE x,y:?CHR$(c);
1 ' DRAW OBSTACLE
20030 MOVE ox,oy:?oc$;
28990 TAGOFF
29000 RETURN

1 '=========================
1 '=== INIT
1 '=========================
65000 SYMBOL AFTER 256
65010 CALL &BBFF:CALL &BB4E
65020 MODE 0:BORDER 13
65030 DEFINT a-z
1 ' Init variables 
65040 i=0:j=0:die=0:jvy=12:d=0
1 ' Init Dino
65050 x=32:y=48:vy=0:jj=0:py=y:c=250
1 ' Init Obstacle
65060 ox=608:oy=48:ovx=-7:oc$=CHR$(240)+CHR$(32)

1 ' Draw Ground
65100 j=4:FOR i=0TO 640 STEP 4
65110 MOVE i,32:DRAWR 0,-32,j
65120 j=j+1:IF j=9 THEN j=4
65130 NEXT 

65500 RETURN