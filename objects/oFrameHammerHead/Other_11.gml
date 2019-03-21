/// @description Creation
name = "HAMMER"

shot_speed = 2.5 + global.stage * 0.25
if global.extreme
	shot_period = seconds(0.85)
else
	shot_period = seconds(1.5)
alarm[0] = seconds(2)

invincible = INVINCIBLE_PARENTAL
