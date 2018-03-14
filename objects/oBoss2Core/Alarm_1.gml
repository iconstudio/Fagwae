/// @description Patern 1

var pd = point_direction(x, y, global.px, global.py)

if ++shot_count < 5 {
	var counter = pattern01_list[shot_count - 1]
	var shot_angular
	if counter == 1
		shot_angular = pd
	else
		shot_angular = pd - counter * 6.5

	for (var i = 0; i < counter; ++i)
		enemy_shot(x, y, shot_speed, shot_angular + i * 13)

	alarm[1] = max(8, 20 - global.extreme * 10 - global.stage * 4)
} else if global.extreme {
	var counter = 8
	var shot_angular = pd - counter * 7.5

	for (var i = 0; i < counter; ++i)
		enemy_shot(x, y, shot_speed, shot_angular + i * 15)

	shot_count = 0
}
