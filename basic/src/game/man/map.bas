1 ' 31000-32999
1 ' =================================
1 ' === ENTITY MANAGER
1 ' =================================
1 ' 
1 ' INIT:   31000
1 '
1 ' -------------------------------
1 ' INIT
31000 ms=1:GOSUB 31100
31010 RETURN

1 ' -------------------------------
1 ' MAP SELECT and DECRUNCH
1 ' ms selected map
31100 i=@mm(0,ms):ii=i+100:j=@m(0)
31110 WHILE i<ii
31120 k=PEEK(i) 
31130 FOR f=1TO 8
31140 IF (k AND 128)THEN POKE j,255 ELSE POKE j,0
31150 j=j+1:k=(2*k)AND 255
31160 NEXT
31170 i=i+1
31180 WEND
31190 mc=1:RETURN