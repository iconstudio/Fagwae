/// @description Initialization
// bgm
alarm[3] = seconds(1.5)

// initiator
// player
player_appear_time = seconds(1)
player_isfirst = true
session = game_session_create()

global.extreme = true
global.stage = 0
area_begin = oStageShape
instance_create_layer(0, 0, "Backend", area_begin)

// achievements
event_user(1)

// achievements update
event_user(2)

// ui
ui_alpha = 0
ui_appear_time = 0
ui_appear_period = seconds(0.94)
pause_alpha = 0
shadow_alpha = 0
shadow_time = 0
shadow_period = seconds(1)

// drawing hp bar
gauge_target = noone
gauge_target_name = ""
gauge_target_ratio = 0
gauge_time = 0
gauge_period = seconds(2)
gauge_alpha = 0
gauge_show_time = 0
gauge_show_period = seconds(1.26)

gauge_texloop_y = 0
gauge_texloop_y_max = 8
gauge_texloop_time = 0
gauge_texloop_period = seconds(2 - global.stage * 0.1)
gauge_rots = 0
