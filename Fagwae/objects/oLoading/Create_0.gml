/// @description Loading
audio_loaded = false

if audio_group_is_loaded(audiogroup_game) {
	audio_loaded = true
	alarm[0] = 1
} else {
	audio_group_load(audiogroup_game)
}
