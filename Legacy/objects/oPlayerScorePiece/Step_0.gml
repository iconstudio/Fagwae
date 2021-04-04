/// @description Tracking player of going down
if room_height + 10 < bbox_top
	instance_destroy()

image_angle += 0.5 * angle_dir
if !homing {
	if 0 < stop_time {
		speed = ease_in_cubic(stop_time / stop_period) * velocity_begin
		stop_time--
	} else {
		enable = true

		vspeed = velocity_time / velocity_period * velocity_value
		if velocity_time < velocity_period
			velocity_time++
	}
}

if enable {
	if homing {
		if !global.playeralive {
			homing = false
			exit
		}

		direction = point_direction(x, y, global.px, global.py)
		speed = homing_velocity
	} else if global.playeralive {
		if point_distance(x, y, global.px, global.py) <= 144
			homing = true
	}
}


