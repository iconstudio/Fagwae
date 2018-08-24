/// @description 

image_angle += type_create * 0.5
if radius > 0
	radius -= 2 + global.extreme
else if radius < 0
	radius += 2 + global.extreme
else
	radius = 0

x = 270 + lengthdir_x(radius, image_angle + 90)
y = 480 + lengthdir_y(radius, image_angle + 90)
