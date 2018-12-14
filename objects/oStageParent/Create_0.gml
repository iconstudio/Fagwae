/// @description Initialization

// initiator
alarm[11] = seconds(1)
available = false

randomize()

// flags
flag_boss = false
flag_stop = false
flag_await_die = false
flag_supply = true

// background
back_surface = -1
back_mode = 0
back_alpha = 0

background_param = 0
scroll = 0
rotation = 0
brightness = 0

background_layer_id = layer_get_id("Background_Color")
background_id = layer_background_get_id(background_layer_id)

// score
if !instance_exists(oScore)
	instance_create_layer(0, 0, "Score", oScore)

// create backbuffer surface
event_user(0)
