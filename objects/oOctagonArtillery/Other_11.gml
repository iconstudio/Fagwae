/// @description Creation

image_xscale *= 1.2
image_yscale *= 1.2
enemy_arm_init(enemy_arm_spread_1, 6, 34, script_enemy_arm_init_0)

x_target = x
if type_create == LEFT {
	x_target = 160
	x = -100
} else if type_create == RIGHT {
	x_target = view_width - 160
	x = view_width + 100
}
xstart = x
y_target = 100

shot_mode = 0
shot_speed = 6.5 + global.stage / 3
shot_count = 0

moving_mode = -1 // 0: none, 1: go faster, 2: rotate, 3: slow down
// 4: retreat
paddition = 0
pangle = random(360)
event_user(2)

fleeaway = false
fleeaway_time = 1200

alarm[2] = fleeaway_time
