1 ' 20000-22999
1 ' =================================
1 ' === RENDER SYSTEM
1 ' =================================
1 ' 
1 ' INIT:   20000
1 ' UPDATE: 20100
1 '
1 ' -------------------------------
1 ' INIT
20000 MODE 1
20010 RETURN
1 '
1 ' -------------------------------
1 ' UPDATE
20100 IF mc THEN GOSUB 20200
20110 GOSUB 20300
20120 RETURN
1 '
1 ' -------------------------------
1 ' RENDER MAP
20200 k=ms:mc=0:PRINT ton$:CLS:f=@m(0,ms)
20210 FOR i=0TO 19
20220 FOR j=0TO 39
20230 IF PEEK(f)THEN PRINT s$(3); ELSE PRINT " ";
20240 f=f+1:NEXT j:NEXT i:PRINT tof$;
20250 RETURN
1 '
1 ' -------------------------------
1 ' RENDER ENTITIES
20300 FOR i=1TO een-1
1 ' 20310 LOCATE epx(i),epy(i):PRINT s$(4)
20310 FOR j=1TO eh(i)
20320 LOCATE epx(i),epy(i)+j-1:PRINT STRING$(ew(i),32)
20330 NEXT
20340 LOCATE ex(i),ey(i):PRINT s$(es(i))
20350 NEXT
20360 RETURN
