/// @description Creation
name = "ARTILLERY OCTAGON"
image_xscale *= 1.2
image_yscale *= 1.2

enemy_arm_init(enemy_arm_spread_1, 6, 34, script_enemy_arm_init_0)

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
appear_distance_y = max(0, 100 - ystart)
appear_time = 0
appear_period = seconds(2)
moving_mode = -1 // 0: none, 1: go faster, 2: rotate, 3: slow down, 4: retreat

shot_mode = 0
shot_speed = room_height / seconds(4)
shot_count = 0

rotating = false
rotation = 0
rotate_begin = random(360)
rotate_time = 0
rotate_period = seconds(7)

fleeaway = false
fleeaway_await_time = 0
fleeaway_await_period = seconds(10)
fleeaway_time = 0
fleeaway_period = seconds(4)

alarm[2] = fleeaway_await_period
