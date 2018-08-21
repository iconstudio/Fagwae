/// @description 

if y < global.py - 128
	gravity_direction = min(max(250, gravity_direction + get_rotation_next(gravity_direction, point_direction(x, y, global.px, global.py), 2)), 290)
