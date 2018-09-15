/// @description Initialze Screen, Front-End

// General Screen
event_user(0)
if !shader_is_compiled(shaderFXAA) or !shaders_are_supported()
	fxaa_on = false
else
	fxaa_on = true
fxaa_strength = 7
shaderFXAA_texel = shader_get_uniform(shaderFXAA, "u_texel")
shaderFXAA_level = shader_get_uniform(shaderFXAA, "u_strength")
shaderHQ_tex = shader_get_uniform(shaderHQ, "rubyTextureSize")

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
global.ui_listbox = ds_list_create()

ui_node_init()
ui_width = screen_width
ui_height = screen_height

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
