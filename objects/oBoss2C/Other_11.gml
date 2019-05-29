/// @description Creation
name = "ARM"
invincible = INVINCIBLE_PARENTAL
image_xscale = 1.4
image_yscale = 1.4

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

hspeed_target_begin = room_width / seconds(3) // 1.414
vspeed_target_begin = room_height / seconds(3) // 5
hspeed_target_pattern02 = room_width / seconds(2.8) // 1.61
vspeed_target_pattern03 = room_height / seconds(3.2) // 2
vspeed_target_pattern04 = vspeed_target_begin * 2 // 8
hspeed_target = hspeed_target_begin
vspeed_target = vspeed_target_begin
shot_speed = enemy_bullet_speed_fast
shot_count = 0
