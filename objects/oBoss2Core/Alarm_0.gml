/// @description Pattern 0

var pd = point_direction(x, y, global.px, global.py)
enemy_shot(x, y, path_speed / 2 + shot_speed, pd + lengthdir_x(20, shot_count * 46))
enemy_shot(x, y, path_speed / 2 + shot_speed, pd + lengthdir_y(20, shot_count * 46))

if global.extreme
	enemy_shot(x, y, path_speed / 2 + shot_speed, pd + random_range(-10, 10), oEnemyBullet2)
enemy_play_shot()

if ++shot_count < 12 + global.extreme * 4
	alarm[0] = 6 - global.extreme * 4
