1 ' =================================
1 ' === MAIN
1 ' =================================
1 ' 

1 ' INIT MANAGERS
1 ' Init Entity Manager
1 ' Create two entities
10 GOSUB 23000
20 GOSUB 23100:ex(0)=10:ey(0)=8:es(0)=2:GOSUB 23100

1 ' INIT SYSTEMS
1 ' Init Input System
1 ' Init Physics System
1 ' Init Render System
30 GOSUB 29000
40 GOSUB 26000
50 GOSUB 20000

1 ' UPDATE SYSTEMS
1 ' Update Input System
1 ' Update Physics System
1 ' Update Render System
60 WHILE 1
70 GOSUB 20100
80 GOSUB 29100
90 GOSUB 26100
100 WEND
