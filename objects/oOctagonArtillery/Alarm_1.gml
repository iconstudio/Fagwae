/// @description 

var dir = point_direction(x, y, global.px, global.py)
enemy_shot(x, y, shot_speed, dir)
if global.extreme {
	enemy_shot(x, y, shot_speed, dir - 25)
	enemy_shot(x, y, shot_speed, dir + 25)
}

if ++shot_count < 2 {
	alarm[1] = max(6, 10 - global.stage / 3 - global.extreme * 2)
} else {
	shot_count = 0

	alarm[0] = max(25, 42 - global.stage * 3 - global.extreme * 5)
}
