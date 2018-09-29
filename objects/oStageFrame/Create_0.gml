/// @description Initialization

event_inherited()
next = oStageShape

available = true

// background
back_color = 0
param_speed = (0.1 * 200 - 10) / 200
back_count = 0
back_factor = 4

// color
current_saturation = 192
current_value = 98
target_saturation = 60
target_value = 21

// back decorataions
deco_count = 0
deco_height = 300

// Initializing stage
script_stage3_ready()

for (var j = 0; j < 7; ++j) {
	for (var i = 0; i < 8; ++i)
		area_enemy_push(0, enemy_triangle_1, 0, 266 + i * 10 + random(20), -15 - random(10))
	area_delay_push(random_range(seconds(0.01), seconds(0.1)))
}
area_delay_push(seconds(2))
area_enemy_push(60, enemy_octopod_1, 0, 270, 100)
