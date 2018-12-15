/// @description Attacking

if y >= 800
	exit

var pd = point_direction(x, y, global.px, global.py)

if shot_mode == 0 {
	enemy_shot(x, y, shot_speed, pd)

	if shot_count++ == 0 {
		alarm[0] = shot_period
	} else if shot_count < ceil(global.stage * 0.333) - global.extreme {
		alarm[0] = shot_period_continue
	} else {
		shot_count = 0
		shot_mode = 1
		alarm[0] = shot_period_reset1
	}
} else {
	if shot_count++ == 0 {
		if global.extreme {
			enemy_shot(x, y, shot_speed + 2, pd - 20)
			enemy_shot(x, y, shot_speed + 2, pd)
			enemy_shot(x, y, shot_speed + 2, pd + 20)
		} else {
			enemy_shot(x, y, shot_speed + 2, pd)
		}
		alarm[0] = shot_period_multi
	} else {
		enemy_shot(x, y, shot_speed + 2, pd - 14)
		enemy_shot(x, y, shot_speed + 2, pd + 14)

		shot_count = 0
		shot_mode = 0
		alarm[0] = shot_period_reset2
	}
}
enemy_play_shot()
