/// @description Shooting to side
if global.extreme {
	enemy_shot(x, y, shot_speed, direction - 45)
	enemy_shot(x, y, shot_speed, direction - 15)
	enemy_shot(x, y, shot_speed, direction + 15)
	enemy_shot(x, y, shot_speed, direction + 45)
} else {
	enemy_shot(x, y, shot_speed, direction - 45)
	enemy_shot(x, y, shot_speed, direction + 45)
}
enemy_play_shot()

alarm[0] = shot_period
