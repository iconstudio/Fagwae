/// @description Initialization

// initiator
alarm[1] = 60
available = false

randomize()

// fade others
with oStageParent {
	if id != other.id {
		depth -= 1
		back_mode = 1 // the others would be gone
	}
}

// flags
flag_boss = false
flag_stop = false

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
score_alpha = -1
score_rotation = 0
score_wave = 0

// create background surface
var layer_id = layer_get_id("Background_Color")
background_id = layer_background_get_id(layer_id)
event_user(0)

// initial waiting
area_delay_push(300)
