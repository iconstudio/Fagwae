/// @description Creation

if global.extreme
	delay = max(2, 9 - global.stage / 2)
else
	delay = max(3, 6 - global.stage / 4)

direction = image_angle
speed = 0.5
gravity_direction = image_angle
gravity = 0.2

alarm[0] = 10
