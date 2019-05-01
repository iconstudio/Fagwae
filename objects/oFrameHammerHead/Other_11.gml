/// @description Creation
name = "HAMMER"

shot_speed = 2.5 + global.stage * 0.25
shot_period = global.extreme ? seconds(1) : seconds(1.5)
alarm[0] = seconds(2)

invincible = INVINCIBLE_PARENTAL
