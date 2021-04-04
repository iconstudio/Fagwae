/// @description enemy_play_shot()
/// @function enemy_play_shot
function enemy_play_shot() {
	if 0 < global.setting_sfx
		return audio_play_sound(soundShotEnemy, 0, false)
	else
		return 0



}
