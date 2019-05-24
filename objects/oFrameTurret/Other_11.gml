/// @description Creation
untargetable = true

shot_mode = global.extreme ? 1 : 0
shot_direction = type_create
shot_speed = enemy_bullet_speed_slowest * 1.1
shot_period = seconds(0.4 - global.extreme * 0.1)
alarm[0] = seconds(1)
