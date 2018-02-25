/// @description 

if y >= 900
	exit

var pd = point_direction(x, y, global.px, global.py)

if shot_mode == 0 {
	shot_count++
	enemy_shot(x, y, shot_speed, pd)

	if shot_count == 0 {
		alarm[0] = max(8, 16 - global.stage) + 6
	} else if shot_count < 2 + global.extreme + floor(global.stage / 3) {
		if global.extreme
			alarm[0] = max(2, 8 - global.stage / 2) + 10
		else
			alarm[0] = max(3, 10 - global.stage / 2) + 10
	} else {
		shot_count = 0
		shot_mode = 1
		alarm[0] = 80 - global.stage * 2
	}
} else {
	if shot_count++ == 0 {
		if global.extreme {
			enemy_shot(x, y, shot_speed + 2, pd - 20)
			enemy_shot(x, y, shot_speed + 2, pd)
			enemy_shot(x, y, shot_speed + 2, pd + 20)
			alarm[0] = max(8, 20 - global.stage * 4)
		} else {
			enemy_shot(x, y, shot_speed + 2, pd)
			alarm[0] = max(12, 20 - global.stage * 3)
		}
	} else {
		enemy_shot(x, y, shot_speed + 2, pd - 14)
		enemy_shot(x, y, shot_speed + 2, pd + 14)

		shot_count = 0
		shot_mode = 0
		alarm[0] = max(20, 60 - global.stage * 4)
	}
}
