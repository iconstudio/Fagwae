/// @description 

if y >= 700
	exit

var pd = point_direction(x, y, global.px, global.py)
if count_shot == 0 {
	enemy_shot(x, y, speed_shot, pd)
} else {
 enemy_shot(x, y, speed_shot, pd - count_shot * 12)
 enemy_shot(x, y, speed_shot, pd + count_shot * 12)
}

if ++count_shot < 4 {
	if global.extreme
		alarm[0] = max(2, 9 - global.stage / 2)
	else
		alarm[0] = max(2, 12 - global.stage / 2)
} else {
	count_shot = 0
	if global.extreme
		alarm[0] = max(5, 12 - global.stage / 5)
	else
		alarm[0] = max(8, 60 - global.stage * 4)
}
