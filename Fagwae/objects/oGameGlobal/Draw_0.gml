/// @description Drawing the paused screen
if global.paused {
	if sprite_exists(capture) {
		var value = (pause_lit_time / pause_lit_period) * pause_lit_value
		shader_set(shaderPauseLit)
		shader_set_uniform_f(pause_lit_stage, value)
		draw_sprite(capture, 0, 0, 0)
		shader_reset()
	}
}
