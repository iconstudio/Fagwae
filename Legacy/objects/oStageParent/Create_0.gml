/// @description Initialization
randomize()

// flags
flag_boss = false
flag_stop = false
flag_await_die = false
flag_supply = true
flag_await_clear = false

// background
background_param = 0
scroll = 0
rotation = 0
brightness = 0
brightness_time = 0
brightness_period = seconds(1.1)

background_layer_id = layer_get_id("Background_Color")
background_id = layer_background_get_id(background_layer_id)

// score drawer
if !instance_exists(oScore)
	instance_create_layer(0, 0, "Score", oScore)
