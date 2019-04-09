/// @description Creation
untargetable = true

shot_speed = 3 + global.stage * 0.167 + global.extreme
shot_direction = 90
shot_period = seconds(max(2 - global.extreme * 0.5, 2.66 - global.stage * 0.094))
alarm[0] = seconds(3)
