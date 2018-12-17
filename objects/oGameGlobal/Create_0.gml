/// @description Initialization
camera_projection_identity()

// bgm
alarm[3] = 120

// initiator
// player
player_counter = seconds(1)
player_isfirst = true
global.vscore = 0

global.stage = 1
instance_create_layer(0, 0, "Backend", oStageShape)

// achievements
event_user(1)

// achievements update
event_user(2)

// screen effecf
shadow_alpha = 0
global.screenshadowy = 0

// fade
fade_alpha = 0

// drawing hp bar
global.gauge_count = 0
global.gauge_target = noone
global.gauge_alpha = 0

global.gauge_caption = ""
global.gauge_hp = 0
global.gauge_hp_max = 0

gaugetexy = 0
gaugerots = 0
