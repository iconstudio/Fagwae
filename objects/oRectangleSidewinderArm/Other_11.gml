/// @description Creation

homing = false
home_angle = 0

if global.extreme
	delay = max(2, 9 - global.stage * 0.5)
else
	delay = max(3, 6 - global.stage * 0.25)

