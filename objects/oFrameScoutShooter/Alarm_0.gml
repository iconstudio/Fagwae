/// @description Shots 1
enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))
enemy_play_shot()

if shot_count++ < 1
	alarm[0] = shot_period
