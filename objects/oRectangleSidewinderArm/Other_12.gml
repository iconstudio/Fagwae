/// @description Update
event_inherited()

if homing {
	if homing_time < homing_period {
		direction += get_rotation_next(direction, point_direction(x, y, global.px, global.py), 1)

		image_angle = direction
		homing_time++
	}
	speed = velocity_value * velocity_time / velocity_period
	if velocity_time < velocity_period
		velocity_time++
}
