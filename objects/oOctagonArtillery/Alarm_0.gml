/// @description Shooting 4-2-4
if moving_mode == 2
	exit

if shot_phase < 2 {
	if shot_count == 0
		shot_direction = point_direction(x, y, global.px, global.py)
	if shot_count mod 2 == 0 {
		enemy_shot(x, y, shot_speed, shot_direction - 22)
		enemy_shot(x, y, shot_speed, shot_direction)
		enemy_shot(x, y, shot_speed, shot_direction + 22)
		enemy_shot(x, y, shot_speed, shot_direction + 44)
		enemy_play_shot()
	} else {
		enemy_shot(x, y, shot_speed, shot_direction - 44)
		enemy_shot(x, y, shot_speed, shot_direction - 22)
		enemy_shot(x, y, shot_speed, shot_direction)
		enemy_shot(x, y, shot_speed, shot_direction + 22)
		enemy_play_shot()
	}
	if ++shot_count < 3 + global.extreme {
		alarm[0] = shot_period1
	} else {
		shot_count = 0
		shot_phase++

		alarm[0] = shot_period1_continue
	}
} else {
	shot_direction = point_direction(x, y, global.px, global.py)
	enemy_shot(x, y, shot_speed, shot_direction - 11)
	enemy_shot(x, y, shot_speed, shot_direction + 11)
	enemy_play_shot()

	shot_count = 0
	shot_phase = 0

	alarm[1] = seconds(0.2)
} 