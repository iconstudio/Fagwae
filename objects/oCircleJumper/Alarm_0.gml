/// @description 

if moving_mode == 0 {
	enemy_shot(x, y, shot_speed, point_direction(x, y, global.px, global.py))

	moving_mode = 1
	alarm[0] = 50 - global.extreme * 30
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

speed = 20 // jump
