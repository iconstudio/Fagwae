/// @description Creation

enemy_arm_init(enemy_arm_rectangle_2, 4, 23)

y = 120
x_target = x
x_begin = x
var xborder = 120
if type_create == RIGHT {
	x_target = xborder
	x = view_width + 100
	x_begin = view_width - xborder
} else if type_create == LEFT {
	x_target = view_width - xborder
	x = -100
	x_begin = xborder
}
moving_mode = 2
moving_count = 0

shot_dir = 0
shot_speed = 4.5 + global.stage / 4
shot_count = 0
shot_mode = 0

pangle = random(360)
image_angle = 0
