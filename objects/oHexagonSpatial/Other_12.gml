/// @description Update
enemy_arm_fix()
if y < global.py - 128
	direction = min(max(225, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 1.5)), 315)

image_angle = rotate_begin + rotate_time / rotate_period * 360
if rotate_time < rotate_period
	rotate_time++
else
	rotate_time = 0
