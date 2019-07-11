/// @description Update
if pattern == 0 {
	if pattern00_time < pattern00_period {
		pattern00_time++
	} else {
		if pattern00_await_time < pattern00_await_period {
			pattern00_await_time++
		} else {
			pattern00_time = 0
			pattern00_await_time = 0

			pattern00_y_begin = y

			if pattern00_y_destination < y
				pattern = 1
		}
	}

	y = lerp(pattern00_y_begin, pattern00_y_begin + pattern00_distance, ease_out_quad(pattern00_time / pattern00_period))
} else if pattern == 1 {
	
}

var speed_previous = speed, direction_previous = direction
for (var i = 0; i < arm_number; ++i) {
	arm = arm_properties[i]

	if instance_exists(arm[0]) {
		speed = arm[1]
		direction = arm[2] + image_angle + rotation
		arm[0].x = x + hspeed
		arm[0].y = y + vspeed
		arm[0].image_angle = arm[0].arm_angle_fixed + rotation
	}
}
speed = speed_previous
direction = direction_previous