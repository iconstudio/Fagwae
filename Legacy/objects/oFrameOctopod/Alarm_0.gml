/// @description Attacking 1, 3 or 12
if type_create == 0 {
	enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))

	alarm[0] = seconds(1)
} else {
	var pd = point_direction(x, y, global.px, global.py)

	if !global.extreme { // shots 3
		enemy_shot(x, y, shot_speed, pd - 18)
		enemy_shot(x, y, shot_speed, pd)
		enemy_shot(x, y, shot_speed, pd + 18)
	} else { // shots 12
		for (var i = 0; i < 360; i += 30)
			enemy_shot(x, y, shot_speed, pd + i)
	}

	alarm[0] = max(40, 100 - global.stage * 10 - global.extreme * 30)
}
enemy_play_shot()
