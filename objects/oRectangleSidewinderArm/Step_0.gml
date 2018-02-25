/// @description 

if homing {
	home_angle += get_rotation_next(home_angle, point_direction(x, y, global.px, global.py), 3)

	if global.extreme
		direction = home_angle
	gravity_direction = home_angle
	image_angle = direction
}
