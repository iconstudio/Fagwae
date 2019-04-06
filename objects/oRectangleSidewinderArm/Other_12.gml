/// @description Update
event_inherited()

if homing {
	if homing_time < homing_period {
		homing_angle += get_rotation_next(homing_angle, point_direction(x, y, global.px, global.py), 3)

		if global.extreme
			direction = homing_angle
		gravity_direction = homing_angle
		image_angle = direction
		homing_time++
	}
}
if speed > 3
	speed = 3
