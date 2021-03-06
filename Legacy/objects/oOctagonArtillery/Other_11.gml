/// @description Creation
name = "ARTILLERY OCTAGON"
image_xscale *= 1.2
image_yscale *= 1.2

enemy_arm_init(enemy_arm_spread_1, 6, 34, script_enemy_arm_init_0)

y = 180
x_target = x
if type_create == LEFT {
	x_target = 160
	x = -100
} else if type_create == RIGHT {
	x_target = room_width - 160
	x = room_width + 100
}
xstart = x
appear_distance_x = x_target - x
appear_time = 0
appear_period = seconds(2)
moving_mode = 0 // 0: none, 1: attack, 2: retreat
rotation = 0

shot_phase = 0
shot_speed = enemy_bullet_speed_fast
shot_direction = 0
shot_count = 0
shot_period1 = seconds(max(0.12, 0.3 - global.stage * 0.06 - global.extreme * 0.1))
shot_period1_continue = seconds(max(0.64 - global.extreme * 0.2, 0.9 - global.stage * 0.16))
shot_period2 = seconds(max(0.13, 0.3 - global.stage * 0.09 - global.extreme * 0.1))
rotating = false
rotation = 0
rotate_begin = random(360)
rotate_time = 0
rotate_period = seconds(7)

fleeaway_await_period = seconds(10)
disappear_time = 0
disappear_period = seconds(3.2)
alarm[2] = fleeaway_await_period
