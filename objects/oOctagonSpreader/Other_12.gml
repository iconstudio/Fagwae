/// @description Update
if shot_mode == 0 {
	y = ystart + appear_time / appear_period * appear_distance
	if appear_time < appear_period {
		appear_time++
		if appear_time == appear_period
			alarm[0] = seconds(1)
	}
} else {
	vspeed = accel_value * accel_time / accel_period
	if accel_time < accel_period
		accel_time++

	if y < global.py - 100
		direction = min(max(225, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 0.5)), 315)
}

enemy_arm_fix(shot_rotation)
shot_rotation = rotate_begin + rotate_time / rotate_period * 360
if rotate_time < rotate_period
	rotate_time++
else
	rotate_time = 0
