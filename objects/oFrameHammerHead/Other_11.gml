/// @description Creation
name = "HAMMER"

shot_speed = enemy_bullet_speed_medium
shot_period = global.extreme ? seconds(0.4) : seconds(0.5)
alarm[0] = seconds(1)

invincible = INVINCIBLE_PARENTAL
