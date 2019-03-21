/// @description Update
event_inherited()

enemy_arm_fix()
if y < global.py - 64
	direction = min(max(225, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 1.5)), 315)
