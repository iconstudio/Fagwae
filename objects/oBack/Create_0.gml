/// @description Initialization

// initiator
available = false
alarm[1] = 30

// color
scroll = 0
background_saturation = 0
square_saturation = 0
rots = 0

// background
var layer_id = layer_get_id("Background_Color")
background_id = layer_background_get_id(layer_id)
brightness = 0
event_user(0)

score_alpha = -1
score_rotation = 0
score_wave = 0
global.vscore = 0

dcnt1 = 3
dcnt2 = 4
alarm[0] = 40

shstep = 1800
