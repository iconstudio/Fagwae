/// @description Initialization

camera_projection_identity()

// bgm
global.music_before = noone
global.music_current = musicMainMenu
music_update(musicMainMenu)
alarm[3] = 120



// initiator
// player
player_counter = 60
player_isfirst = true
instance_create_layer(0, 0, "Backend", global.area_list[0])
global.stage = 1

global.vscore = 0

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
