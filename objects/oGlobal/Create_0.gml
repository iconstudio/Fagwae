/// @description Initialze Screen, Front-End

// General Screen
event_user(0)

if !shaders_are_supported() {
	fxaa_on = false
	distort = false
} else {
	fxaa_on = false
	distort = shader_is_compiled(shaderCRT)
}

fxaa_strength = 7
shaderFXAA_texel = shader_get_uniform(shaderFXAA, "u_texel")
shaderFXAA_level = shader_get_uniform(shaderFXAA, "u_strength")
shaderHQ_tex = shader_get_uniform(shaderHQ, "rubyTextureSize")
//shader_set_uniform_f(shaderHQ_tex, view_width, view_height)

swd = 15 // interpolations
shd = 15
exw = 32 / swd // extra space
exh = 32 / shd
emw = 144 / swd // curve
emh = 160 / shd
tx = []
ty = []
px = []
py = []
for (var j = 0; j <= shd; ++j) {
	for (var i = 0; i <= swd; ++i) {
		tx[i, j] = surfw / swd * i
		ty[i, j] = surfh / shd * j
		px[i, j] = 432 / swd * i + 24
		py[i, j] = 600 / shd * j + 20
		pds[i, j] = point_distance(px[i, j], py[i, j], room_width * 0.5, room_height * 0.5)
		if pds[i, j] != 0 {
			px[i, j] += lengthdir_x((i - swd * 0.5) * exw, (j - shd * 0.5) * emw)
			py[i, j] += lengthdir_y((shd * 0.5 - j) * exh, 90 + (i - swd * 0.5) * emh)
		}
	}
}

crt_surface_width  = surface_get_width(application_surface)
crt_surface_height = surface_get_width(application_surface)
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
shakelevel = 4
global.screenshake = 0

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
