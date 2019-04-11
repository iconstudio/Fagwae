/// @description Update
event_inherited()

if moving_mode == 0 { // at first
	var appear_ratio = appear_time / appear_period
	x = xstart + appear_ratio * appear_distance_x
	if appear_time < appear_period {
		appear_time++
		if appear_time == appear_period {
			alarm[0] = seconds(1)
			moving_mode = 1
			rotating = true
		}
	}
} else if moving_mode == 2 {
	x = xstart + ease_out_quad(1 - disappear_time / disappear_period) * appear_distance_x
	if disappear_time < disappear_period
		disappear_time++
	else
		instance_destroy()
}

enemy_arm_fix(shot_rotation)
shot_rotation = rotate_begin + rotate_time / rotate_period * 360
if rotating {
	if rotate_time < rotate_period
		rotate_time++
	else
		rotate_time = 0
}
