/// @description Shooting side
if global.extreme {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 225)
	enemy_shot(x, y, speed * 0.25 + 1, direction - 195)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 195)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 225)
} else {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 225)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 225)
}
enemy_play_shot()

alarm[0] = shot_period
