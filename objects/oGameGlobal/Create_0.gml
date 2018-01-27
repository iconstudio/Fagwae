/// @description 

global.vscore = 0
global.playeralive = false
event_user(0)

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

instance_create_depth(0, 0, "Background", oBack)
