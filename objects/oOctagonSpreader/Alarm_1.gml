/// @description Shooting 4

if y < 700 {
	var sspd = 3 + global.stage / 8
	var pd = point_direction(x, y, global.px, global.py)
	enemy_shot(x, y, sspd, pd - 30)
	enemy_shot(x, y, sspd * 1.16, pd - 10)
	enemy_shot(x, y, sspd * 1.16, pd + 10)
	enemy_shot(x, y, sspd, pd + 30)
	enemy_play_shot()

	alarm[1] = max(1,35 - global.stage * 2)
}
