/// @description Pattern 4

if dead or pattern != 4 {
	pattern04_ended = false
	exit
}

if pattern04_ended
	exit

if global.extreme {
	for (var i = 0; i < 6; ++i) {
		enemy_shot(x, y, shot_speed + 2, i * 60 + 25, oEnemyBullet2)
		enemy_shot(x, y, shot_speed + 2, i * 60 + 35, oEnemyBullet2)
	}
} else {
	for (var i = 0; i < 6; ++i) {
		enemy_shot(x, y, shot_speed, i * 60 + 25)
		enemy_shot(x, y, shot_speed, i * 60 + 35)
	}
}
audio_play_sound(soundShotEnemy, 0, false)

alarm[3] = 50
