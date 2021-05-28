/// @description Update
event_inherited()

enemy_arm_fix()
if speed > speed_target
	speed = speed_target

if y < global.py - 128
	gravity_direction = min(max(250, gravity_direction + get_rotation_next(gravity_direction, point_direction(x, y, global.px, global.py), 2)), 290)

image_angle = rotate_begin + rotate_time / rotate_period * 360
if rotate_time < rotate_period
	rotate_time++
else
	rotate_time = 0
