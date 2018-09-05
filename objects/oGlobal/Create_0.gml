/// @description Initialze Screen, Front-End

global.shaBlur_texelSize = shader_get_uniform(shaderBlur, "texelSize")

global.shared_surface = -1
ui_shared_surface()

// General Screen
event_user(0)

capture = noone
global.screenlock = false

// Shake
xo = 0
yo = 0
xn = 0
yn = 0
shakelevel = 4
global.screenshake = 0

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
