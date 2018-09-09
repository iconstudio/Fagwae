/// @description Initialze Screen, Front-End

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

// UI
global.shaBlur_texelSize = shader_get_uniform(shaderBlur, "texelSize")

global.ui_top = noone
global.ui_listbox = ds_list_create()
global.shared_surface = -1
//ui_shared_surface()

ui_node_init()
ui_width = screen_width
ui_height = screen_height
ui_create(0, 0, oUISettingButton, "UI")

// Push Notification
callto = noone
construct = array_create(3)
notification_list = ds_list_create()
