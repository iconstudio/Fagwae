/// @description Attacking

if y >= 700
	exit

var pd = point_direction(x, y, global.px, global.py)
if shot_count == 0 {
	enemy_shot(x, y, shot_speed, pd)
} else {
	enemy_shot(x, y, shot_speed, pd - shot_count * 12)
	enemy_shot(x, y, shot_speed, pd + shot_count * 12)
}

if ++shot_count < 4 {
	if global.extreme
		alarm[0] = max(2, 9 - global.stage / 2)
	else
		alarm[0] = max(2, 12 - global.stage / 2)
} else {
	shot_count = 0
	if global.extreme
		alarm[0] = max(5, 12 - global.stage / 5) + 10
	else
		alarm[0] = max(8, 60 - global.stage * 4) + 10
}
