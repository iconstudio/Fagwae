/// @description Shooting

if global.extreme {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 45)
	enemy_shot(x, y, speed * 0.25 + 1, direction - 15)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 15)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 45)
} else {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 45)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 45)
}

alarm[0] = delay
