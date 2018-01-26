/// @description Initialization

bd2 = 40

tsiz = 120

nsiz = 12
psiz = 0
osiz = tsiz * 2

cdet = 15
fdet = cdet - 1

aorg = random(360)
var csiz = 360 / cdet
for (var i = 0; i < cdet; ++i)
	cang[i] = csiz * i + aorg

event_user(0)
