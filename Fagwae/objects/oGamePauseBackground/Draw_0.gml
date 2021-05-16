/// @description Drawing the paused screen
if global.paused {
	if capture_texture != -1 {
		var value = (time / period) * lit_value
		shader_set(shaderPauseLit)
		texture_set_stage(global.pause_lit_stage, capture_texture)
		shader_set_uniform_f(global.pause_lit_value, value)
		draw_sprite(capture, 0, 0, 0)
		shader_reset()
	}
}
