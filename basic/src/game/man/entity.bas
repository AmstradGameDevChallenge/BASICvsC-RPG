1 ' 23000-25999
1 ' =================================
1 ' === ENTITY MANAGER
1 ' =================================
1 ' 
1 ' INIT:   23000
1 ' CREATE: 23100

1 ' -------------------------------
1 ' INIT
23000 i=0:een=1
23010 ex(i)=1:ey(i)=1:evx(i)=0:evy(i)=0
23020 ew(i)=2:eh(i)=2:es(i)=0
23030 ea(i)=30:ed(i)=15:ee(i)=100:ef(i)=0
23040 RETURN

1 ' -------------------------------
1 ' CREATE
23100 i=een:k=0:een=een+1
23110 ex(i)=ex(k):ey(i)=ey(k):evx(i)=evx(k):evy(i)=evy(k)
23120 ew(i)=ew(k):eh(i)=eh(k):es(i)=es(k)
23130 ea(i)=ea(k):ed(i)=ed(k):ee(i)=ee(k):ef(i)=ef(k)
23140 RETURN