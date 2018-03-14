/// @description Pattern 0

var pd = point_direction(x, y, global.px, global.py)
enemy_shot(x, y, path_speed / 2 + shot_speed, pd + lengthdir_x(20, shot_count * 47))
enemy_shot(x, y, path_speed / 2 + shot_speed, pd + lengthdir_y(20, shot_count * 47))

if global.extreme
	enemy_shot(x, y, path_speed / 2 + shot_speed, pd + random_range(-10, 10), oEnemyBullet2)

if ++shot_count < 10 + global.extreme * 4
	alarm[0] = max(2, 9 - global.extreme * 4 - global.stage)
