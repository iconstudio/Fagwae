/// @description Attacking
var pd = point_direction(x, y, global.px, global.py)

if shot_phase == 0 {
	enemy_shot(x, y, shot_speed, pd)
	if shot_count++ == 0 {
		alarm[0] = shot_period1
	} else {
		shot_phase = 1
		shot_count = 0
		alarm[0] = shot_period2
	}
} else {
	enemy_shot(x, y, shot_speed + 2, pd)

	if ++shot_count < 2 {
		alarm[0] = shot_period_continue
	}
}
enemy_play_shot()
