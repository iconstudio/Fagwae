/// @description Creation

homing = false
home_angle = 0

if global.extreme
	delay = max(4, 9 - global.stage * 0.5)
else
	delay = max(6, 9 - global.stage * 0.25)

