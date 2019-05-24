/// @description Creation
untargetable = true

shot_mode = global.extreme ? 1 : 0
shot_direction = type_create
shot_speed = enemy_bullet_speed_faster
shot_period = seconds(1.3 - global.extreme * 0.15)
alarm[0] = seconds(3)
