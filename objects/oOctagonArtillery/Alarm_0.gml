/// @description Shooting 424

if moving_mode == 4
	exit

var dir = point_direction(x, y, global.px, global.py)
if shot_count mod 2 == 0 and shot_mode < 2 {
	enemy_shot(x, y, shot_speed, dir - 15)
	enemy_shot(x, y, shot_speed, dir)
	enemy_shot(x, y, shot_speed, dir + 15)
	enemy_shot(x, y, shot_speed, dir + 30)
	audio_play_sound(soundShotEnemy, 0, false)
} else if shot_mode < 2 {
	enemy_shot(x, y, shot_speed, dir - 30)
	enemy_shot(x, y, shot_speed, dir - 15)
	enemy_shot(x, y, shot_speed, dir)
	enemy_shot(x, y, shot_speed, dir + 15)
	audio_play_sound(soundShotEnemy, 0, false)
}

if shot_mode >= 2 {
	enemy_shot(x, y, shot_speed, dir - 7.5)
	enemy_shot(x, y, shot_speed, dir + 7.5)
	audio_play_sound(soundShotEnemy, 0, false)

	shot_count = 0
	shot_mode = 0

	alarm[1] = 5
} else if ++shot_count < 3 + global.extreme {
	alarm[0] = max(7, 11.5 - global.stage * 0.5 - global.extreme * 2)
} else {
	shot_count = 0
	shot_mode++

	alarm[0] = max(25, 42 - global.stage * 3 - global.extreme * 5)
}
