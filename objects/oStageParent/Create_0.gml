/// @description Initialization

// initiator
alarm[1] = 60
available = false

randomize()

// flags
flag_boss = false
flag_stop = false
flag_await_die = false

// for stage title (each stage)
alarm[2] = 1

// background
back_surface = -1
back_mode = 0
back_alpha = 0

background_param = 0
scroll = 0
rotation = 0
brightness = 0

// score
if !instance_exists(oBackground)
	instance_create_layer(0, 0, "Score", oBackground)

// create backbuffer surface
event_user(0)

// initial waiting
area_delay_push(90)
