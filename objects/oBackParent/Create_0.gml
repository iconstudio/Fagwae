/// @description Initialization

// initiator
alarm[1] = 60

// background
var layer_id = layer_get_id("Background_Color")
background_id = layer_background_get_id(layer_id)

global.vscore = 0

event_user(0)
