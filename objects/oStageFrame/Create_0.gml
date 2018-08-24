/// @description Initialization

event_inherited()

available = true

// color
back_color = 0
param_speed = (0.1 * 200 - 10) / 200

current_saturation = 192
current_value = 98

target_saturation = 60
target_value = 21

// back decorataions
deco_count = 0
deco_height = 300

// Initializing stage
area_music_push(0, musicStage3)

area_enemy_push(60, enemy_abomination_1, 0, 270, 100)
