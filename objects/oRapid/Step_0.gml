/// @description 

if y < global.py - 80
	direction = min(max(225, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 2)), 315)

image_angle = direction
