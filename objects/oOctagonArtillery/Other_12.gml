/// @description Update
event_inherited()

if moving_mode == -1 { // at first
	var appear_ratio = appear_time / appear_period
	x = xstart + appear_ratio * appear_distance_x
	y = ystart + appear_ratio * appear_distance_y
	if appear_time < appear_period {
		appear_time++
		if appear_time == appear_period {
			alarm[0] = seconds(1)
			moving_mode = 1
			rotating = true
		}
	}
} else if moving_mode == 0 {
} else if moving_mode == 4 {
	if abs(x - xstart) < 4 {
		instance_destroy()
	} else if x > xstart { // left
		if hspeed != -3
			hspeed += (-3 - hspeed) / 8
	} else if x < xstart { // right
		if hspeed != 3
			hspeed += (3 - hspeed) / 8
	}
}

enemy_arm_fix(shot_rotation)
shot_rotation = rotate_begin + rotate_time / rotate_period * 360
if moving_mode > 0 {
	if rotate_time < rotate_period
		rotate_time++
	else
		rotate_time = 0
}
