/// @description Shooting 1-1 x 3+
shot_direction = point_direction(x, y, global.px, global.py)
var cx = x + lengthdir_x(24, shot_direction)
var cy = y + lengthdir_y(24, shot_direction)
enemy_shot(cx, cy, shot_speed, shot_direction, oEnemyBullet2)
enemy_play_shot()

if shot_progress < 3 {
	if ++shot_count < 2 + global.extreme {
		alarm[0] = shot_period_multi
	} else {
		shot_count = 0
		shot_progress++
		alarm[0] = shot_period
	}
} else if global.extreme {
	enemy_shot(cx, cy, shot_speed, shot_direction - 30, oEnemyBullet2)
	enemy_shot(cx, cy, shot_speed, shot_direction + 30, oEnemyBullet2)
}