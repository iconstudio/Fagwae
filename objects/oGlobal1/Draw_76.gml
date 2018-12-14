if fxaa_on {
	shader_set(shaderFXAA)
	shader_set_uniform_f(shaderFXAA_texel, texture_get_texel_width(global.surface_tex), texture_get_texel_height(global.surface_tex))
	shader_set_uniform_f(shaderFXAA_level, fxaa_strength)
}
