/// @description enemy_play_shot()
/// @function enemy_play_shot
if global.setting_sfx > 0
	return audio_play_sound(soundShotEnemy, 0, false)
else
	return 0
