/// @description Creation
name = "RECTANGLE"

enemy_arm_init(enemy_arm_rectangle_2, 4, 31, noone, 0, "Instances_Arms_Below")

x_target = x
x_begin = x
var xborder = 120
if type_create == RIGHT {
	x_target = xborder
	x = room_width + 100
	x_begin = room_width - xborder
} else if type_create == LEFT {
	x_target = room_width - xborder
	x = -100
	x_begin = xborder
}
moving_mode = 2
moving_count = 0

shot_dir = 0
shot_speed = player_hspeed
shot_count = 0
shot_mode = 0
shot_period = seconds(0.2 - global.extreme * 0.14)
shot_period_continue = seconds(1.6 - global.extreme * 0.8)

pangle = random(360)
image_angle = 0
