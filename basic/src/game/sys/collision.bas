1 ' 33000-35999
1 ' =================================
1 ' === COLLISION SYSTEM
1 ' =================================
1 ' 
1 ' INIT:       33000
1 ' UPDATE:     33100
1 ' COLLISION:  33200
1 '
1 ' -------------------------------
1 ' INIT
33000 RETURN
1 '
1 ' -------------------------------
1 ' UPDATE  
33100 FOR x=ex(1)-1 TO ex(1)+ew(1)-2
33110 FOR y=ey(1)-1 TO ey(1)+eh(1)-2
33120 IF m(x,y,ms)>32THEN GOSUB 33200:RETURN
33130 NEXT:NEXT
33140 RETURN
1 '
1 ' -------------------------------
1 ' COLLISION: Restore previous position
33200 ex(1)=epx(1):ey(1)=epy(1)
33210 SOUND 1,500,5
33220 RETURN
