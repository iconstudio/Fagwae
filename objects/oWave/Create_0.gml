/// @description Initialization

border = 20
width_interpolated = 450 + border * 2
height_interpolated = 800 + border * 2
fullwidth_interpolated = room_width + border * 2
fullheight_interpolated = room_height + border * 2

tsiz = 120
nsiz = 12
psiz = 0
osiz = tsiz * 2

cdet = 20
fdet = cdet - 1
aorg = random(360)
var csiz = 360 / cdet
for (var i = 0; i < cdet; ++i)
	cang[i] = csiz * i + aorg

event_user(0)
