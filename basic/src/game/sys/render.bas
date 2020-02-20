1 ' 20000-22999
1 ' =================================
1 ' === RENDER SYSTEM
1 ' =================================
1 ' 
1 ' INIT:   20000
1 ' UPDATE: 20100

1 ' -------------------------------
1 ' INIT
20000 MODE 1
20010 RETURN

1 ' -------------------------------
1 ' UPDATE
20100 IF mc THEN GOSUB 20200
20110 GOSUB 20300
20120 RETURN

1 ' -------------------------------
1 ' RENDER MAP
20200 k=ms:mc=0:LOCATE 1,1
20210 FOR i=0TO 19
20220 FOR j=0TO 39
20230 PRINT CHR$(m(j,i,k));
20240 NEXT j:NEXT i
20250 RETURN

1 ' -------------------------------
1 ' RENDER ENTITIES
20300 FOR i=1TO een-1
20310 LOCATE ex(i),ey(i)
20320 PRINT s$(es(i))
20330 NEXT
20340 RETURN
