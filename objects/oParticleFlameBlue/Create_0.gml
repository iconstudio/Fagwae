/// @description 

event_inherited()

cr[0] = 255
cg[0] = 255
cb[0] = 255
ca[0] = 1

cr[1] = 0
cg[1] = 255
cb[1] = 255
ca[1] = 0.75

cr[2] = 0
cg[2] = 0
cb[2] = 255
ca[2] = 0.5

cr[3] = 0
cg[3] = 0
cb[3] = 0
ca[3] = 0

frame_max = 3
frame = random(1)
cspd = 0.14 + random(0.05)

ra = choose(1, -1)

image_xscale = random(0.6) + 0.6
image_yscale = image_xscale
image_angle = random(360)
