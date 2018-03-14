/// @description Pattern 2

if dead or pattern != 2
	exit

if global.extreme {
	var pd = point_direction(x, y, global.px, global.py)
	enemy_shot(x, y, shot_speed + 1, pd)
}

if shot_count++ == 0 {
	if type_create == LEFT {
		for (var i = 0; i < pattern02_shoot; ++i)
			enemy_shot(x, y, shot_speed, 270 - pattern02_shoot * 30 + i * 43)
	} else if type_create == RIGHT {
		for (var i = 0; i < pattern02_shoot; ++i)
			enemy_shot(x, y, shot_speed, 270 + pattern02_shoot * 30 - i * 43)
	}
} else {
	if type_create == RIGHT {
		if shot_count == 2
			enemy_shot(x, y, shot_speed, 160)
		if shot_count & 1
			enemy_shot(x, y, shot_speed, 200, oEnemyBullet2)
	} else if type_create == LEFT {
		if shot_count == 2
			enemy_shot(x, y, shot_speed, 20)
		if shot_count & 1
			enemy_shot(x, y, shot_speed, 340, oEnemyBullet2)
	}

	if shot_count == 3 {
		enemy_shot(x, y, shot_speed, 270, oEnemyBullet2)
	}
}

if shot_count > 4
	shot_count = 0

pattern02_shoot = 5 - pattern02_shoot

alarm[1] = 9 - global.extreme
