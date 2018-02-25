/// @description 

if y >= 800 or shot_mode != 0
	exit

enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))

if shot_count++ == 0 {
	alarm[0] = max(8, 16 - global.stage) + 6
} else if shot_count < 2 + global.extreme + floor(global.stage / 3) {
	if global.extreme
		alarm[0] = max(2, 8 - global.stage / 2) + 10
	else
		alarm[0] = max(3, 10 - global.stage / 2) + 10
} else {
	shot_count = 0
	alarm[0] = 80 - global.stage * 2
}
