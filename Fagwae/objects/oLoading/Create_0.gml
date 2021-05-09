/// @description Loading
audio_loaded = false

if audio_group_is_loaded(audiogroup_game) {
	audio_loaded = true
	alarm[0] = 1
} else {
	audio_group_load(audiogroup_game)
}


x = SCREEN_W * 0.5
y = SCREEN_H * 0.5

draw_set_color($ffffff)
draw_set_font(fontLoading)
draw_set_halign(1)
draw_set_valign(1)
