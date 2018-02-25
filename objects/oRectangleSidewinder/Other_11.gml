/// @description Creation

vspeed = 16

enemy_arm_init(enemy_arm_rectangle_2, 4, 23)

x_target = x
if type_create == 0 {
	x_target = 160
	x = -100
	xstart = view_width - 160
} else if type_create == 1 {
	x_target = view_width - 160
	x = view_width + 100
	xstart = 160
}
x_targetorg = x_target
moving_mode = -1

shot_dir = 0
shot_speed = 4.5 + global.stage / 4
shot_count = 0
shot_mode = 0

image_angle = random(360)
