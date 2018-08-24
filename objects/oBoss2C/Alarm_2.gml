/// @description Pattern 3

if dead or pattern != 3
	exit

if type_create == LEFT {
	enemy_shot(x, y, shot_speed, 310)
	enemy_shot(x, y, shot_speed, 280)
} else if type_create == RIGHT {
	enemy_shot(x, y, shot_speed, 230)
	enemy_shot(x, y, shot_speed, 260)
}
audio_play_sound(soundShotEnemy, 0, false)

alarm[2] = 20 - global.extreme * 8
