1 ' =================================
1 ' === MAIN
1 ' =================================
1 ' 
1 '
1 ' INIT MANAGERS
1 ' Init Entity Manager
1 ' Init Map Manager
1 ' Create two entities
10 GOSUB 23000
20 GOSUB 31000
30 GOSUB 23100
40 ex(0)=7:ey(0)=6:es(0)=2:GOSUB 23100
50 ex(0)=11:ey(0)=12:es(0)=1:GOSUB 23100
1 '
1 '
1 ' INIT SYSTEMS
1 ' Init Render System
1 ' Init Input System
1 ' Init Physics System
1 ' Init Collision System
100 GOSUB 29000
110 GOSUB 26000
120 GOSUB 20000
130 GOSUB 33000
1 '
1 ' UPDATE SYSTEMS
1 ' Update Render System
1 ' Update Input System
1 ' Update Physics System
1 ' Update Collision System
200 WHILE 1
210 GOSUB 20100
220 GOSUB 29100
230 GOSUB 26100
240 GOSUB 33100
250 WEND
