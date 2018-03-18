/// @description music_update(id)
/// @function music_update
/// @param id { audio }

if !audio_is_playing(argument0) {
	audio_sound_gain(argument0, global.setting_music * 0.1, 0)
	if audio_exists(global.music_current)
		audio_sound_gain(global.music_current, 0, 2000)
	alarm[3] = 120

	global.music_before = global.music_current
	global.music_current = audio_play_sound(argument0, 100, true)
}

return global.music_current
