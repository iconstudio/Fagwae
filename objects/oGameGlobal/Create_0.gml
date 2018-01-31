/// @description Initialization

camera_projection_identity()

// initiator
// player
player_isfirst = true
instance_create_layer(0, 0, "Backend", oStageShape1)
global.stage = 1
alarm[2] = 30

// achievements
event_user(1)

// achievements update
event_user(2)

// screen effecf
shadow_alpha = 0
global.screenshadowy = 0

// drawing hp bar
global.gauge_count = 0
global.gauge_target = noone
global.gauge_alpha = 0

global.gauge_caption = ""
global.gauge_hp = 0
global.gauge_hpmax = 0

gaugetexy = 0
gaugerots = 0

// bgm
audio_stop_all()
audio_play_sound(musicStage1, 0, true)
