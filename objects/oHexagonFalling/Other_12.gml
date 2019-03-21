/// @description Update
event_inherited()

enemy_arm_fix()

if speed > 5
	speed = 5

if y < global.py - 128
	gravity_direction = min(max(250, gravity_direction + get_rotation_next(gravity_direction, point_direction(x, y, global.px, global.py), 2)), 290)
