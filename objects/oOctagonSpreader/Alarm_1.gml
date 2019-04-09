/// @description Shooting 4
if y < 700 {
	var sspd = shot_speed_multi
	var pd = point_direction(x, y, global.px, global.py)
	enemy_shot(x, y, sspd, pd - 30)
	enemy_shot(x, y, sspd * 1.1, pd - 10)
	enemy_shot(x, y, sspd * 1.1, pd + 10)
	enemy_shot(x, y, sspd, pd + 30)
	enemy_play_shot()

	alarm[1] = shot_period_multi
}
