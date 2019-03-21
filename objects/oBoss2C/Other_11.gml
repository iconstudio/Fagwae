/// @description Creation
name = "ARM"

fade_mode = 0

invincible = INVINCIBLE_PARENTAL
image_xscale = 0
image_yscale = 0

// patterns
pattern = 0
pattern_before = 0
pattern_opened = false

pattern02_shoot = 2
pattern04_progress = 0
pattern04_ended = false
pattern05_rotation = 0
pattern05_position = 0

// coordinates
width = 80
if type_create == LEFT
	angular = 225
else if type_create == RIGHT
	angular = 315

x_fix = lengthdir_x(width, angular)
y_fix = lengthdir_y(width, angular)

hspeed_target = 1.414
vspeed_target = 2
shot_speed = 3
shot_count = 0
