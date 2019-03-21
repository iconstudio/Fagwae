/// @description Creation
name = "RECTANGLE"

enemy_arm_init(enemy_arm_rectangle_2, 4, 31)

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
shot_speed = 4.5 + global.stage * 0.25
shot_count = 0
shot_mode = 0

pangle = random(360)
image_angle = 0
