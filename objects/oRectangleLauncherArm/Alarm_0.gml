/// @description Shooting to side

if global.extreme {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 45)
	enemy_shot(x, y, speed * 0.25 + 1, direction - 15)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 15)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 45)
} else {
	enemy_shot(x, y, speed * 0.25 + 1, direction - 45)
	enemy_shot(x, y, speed * 0.25 + 1, direction + 45)
}
audio_play_sound(soundShotEnemy, 0, false)

alarm[0] = delay
