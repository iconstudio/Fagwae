/// @description Initialze Screen, Front-End
// General Screen
event_user(0)

if !shaders_are_supported() {
	fxaa_on = false
	distort_on = false
} else {
	fxaa_on = shader_is_compiled(shaderFXAA)
	distort_on = shader_is_compiled(shaderCRT)
}

fxaa_strength = 7
shaderFXAA_texel = shader_get_uniform(shaderFXAA, "u_texel")
shaderFXAA_level = shader_get_uniform(shaderFXAA, "u_strength")
shaderHQ_tex = shader_get_uniform(shaderHQ, "rubyTextureSize")

crt_surface_width  = surface_get_width(application_surface)
crt_surface_height = surface_get_height(application_surface)
crt_texture = surface_get_texture(application_surface)
crt_texture_width = texture_get_width(crt_texture)
crt_texture_height = texture_get_height(crt_texture)
crt_sample = shader_get_sampler_index(shaderCRT, "samp_CRT")
crt_texture_BaseSize = shader_get_uniform(shaderCRT, "textureBaseSize")
crt_texture_ScaledSize = shader_get_uniform(shaderCRT, "textureScaledSize")
crt_distort = shader_get_uniform(shaderCRT, "distort")
crt_distortion = shader_get_uniform(shaderCRT, "distortion")
crt_border = shader_get_uniform(shaderCRT, "border")

shader_set(shaderCRT)
texture_set_stage(crt_sample, crt_texture)
shader_set_uniform_f(crt_texture_BaseSize, crt_surface_width, crt_surface_height)
shader_set_uniform_f(crt_texture_ScaledSize, crt_surface_width, crt_surface_height)
shader_set_uniform_f(crt_distort, true)
shader_set_uniform_f(crt_distortion, 0.13)
shader_set_uniform_f(crt_border, true)
shader_reset()

capture = noone
global.screenlock = false

// Shake
xo = 0
yo = 0
xn = 0
yn = 0
shake_level = 4
shake_meter = 0
shake_time = 0
shake_period = seconds(1)

// UI
global.ui_top = noone
ui_listchecker = ds_list_create()
ui_listbox_copy = ds_priority_create()
global.ui_listbox = ds_priority_create()

ui_node_init()
ui_width = screen_width
ui_height = screen_height

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
