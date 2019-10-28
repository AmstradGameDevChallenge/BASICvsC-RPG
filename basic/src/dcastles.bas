1 '=============================================== 
1 '== BASIC SCREEN LOADER
1 '== Loads 4 screens that tell the story of the
1 '== game and then loads the game itself
1 '=============================================== 
1 '
1 ' BASIC Video Setup
10 CALL &BB4E:CALL &BBFF:SYMBOL AFTER 256
20 MODE 0:BORDER 0:INK 0,0:i=0:m=0:j=0:v=0
1 ' Load Screen 1 into video memory (now &C000)
30 LOAD"!SCREEN01.BIN",&C000
1 ' Save HIMEM and enable use of memory 
1 ' from &4000 onwards by LOAD commands
1 ' Warning: At least one LOAD command must be done before this, 
1 ' because LOAD allocates a 4K buffer at HIMEM that can 
1 ' only be removed with CLEAR and prevents new MEMORY 
1 ' commands with greater addresses from working
40 m=HIMEM:MEMORY &3FFF
1 ' Load Screen 2 into backbuffer (now &4000)
50 LOAD"!SCREEN02.BIN",&4000
1 ' Horizontal effect + change video memory to &4000 (Bank 1)
60 v=&10:GOSUB 300
1 ' Load Screen 3 into new backbuffer (&C000, now not visible)
70 LOAD"!SCREEN03.BIN",&C000
1 ' Vertical effect + change video memory to &4000 (Bank 3)
90 v=&30:GOSUB 400
1 ' Load Screen 4 into new backbuffer (&4000, now not visible)
100 LOAD"!SCREEN04.BIN",&4000
1 ' Horizontal effect + change video memory to &4000 (Bank 1)
110 v=&10:GOSUB 300
1 ' Restore BASIC's HIMEM to its original value
1 ' CLEAR frees the 4K buffer previously reserved by LOAD
1 ' And also frees all BASIC's reserved space (including variables)
120 MEMORY m:CLEAR
1 ' And now LOAD and RUN Game Loader to start the game
130 RUN"!GLOADER.BAS"
140 END

1 ' ACTIVE WAITING LOOP
1 ' Simple Active Waiting Loop 
1 ' to make effects run slower
1 '
200 FOR j=1TO 40:NEXT
210 RETURN

1 ' HORIZONTAL EFFECT + VIDEO MEMORY CHANGE
1 ' Preform a disappearing and reappearing effect
1 ' by horizontally contracting video memory and then
1 ' expanding it again after changing video memory location
1 ' Changes Video memory to 'v' Bank 
1 '
300 FOR i=40TO 0 STEP -1:OUT &BC00,1:OUT &BD00,i:GOSUB 200:NEXT
310 GOSUB 500
320 FOR i=0TO 40:OUT &BC00,1:OUT &BD00,i:GOSUB 200:NEXT
330 RETURN


1 ' VERTICAL EFFECT + VIDEO MEMORY CHANGE
1 ' Preform a disappearing and reappearing effect
1 ' by vertically contracting video memory and then
1 ' expanding it again after changing video memory location
1 ' Changes Video memory to 'v' Bank 
1 '
400 FOR i=25TO 0 STEP -1:OUT &BC00,6:OUT &BD00,i:GOSUB 200:NEXT
410 GOSUB 500 
420 FOR i=0TO 25:OUT &BC00,6:OUT &BD00,i:GOSUB 200:NEXT
430 RETURN

1 ' SET VIDEO MEMORY BANK TO 'v'
1 ' Sets New video memory location to bank indicated
1 ' by variable 'v'. Possible banks are &00,&10,&20,&30
1 '
500 OUT &BC00,12:OUT &BD00,v
510 RETURN