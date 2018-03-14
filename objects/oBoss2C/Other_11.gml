/// @description Creation

fade_mode = 0

image_xscale = 0
image_yscale = 0

pattern = 0
pattern_before = 0
pattern_opened = false

width = 70
if type_create == LEFT
	angular = 225
else if type_create == RIGHT
	angular = 315

x_fix = lengthdir_x(width, angular)
y_fix = lengthdir_y(width, angular)

shot_speed = 2.5 + global.stage * 0.25
