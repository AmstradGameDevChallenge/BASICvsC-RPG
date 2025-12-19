1 ' ======
1 ' == DRAW WORLD
1 ' ======
1 ' Clean previous
10000 LOCATE px,py:?" ":LOCATE pcx,pcy:?" "
1 ' Redraw
10010 LOCATE x,y:? s$(0):LOCATE cx,cy:? s$(1)
10900 RETURN