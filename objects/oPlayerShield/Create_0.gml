parent = noone

progress = 0
progress_period = seconds(0.05)
alarm[0] = progress_period
collide_time = 0
collide_period = seconds(0.1)
// DPS = 30, 3 damage per collide_period

if global.__cheat_powerful
	pow_default = 7
else
	pow_default = 3
pow = pow_default

fadein_time = 0
fadein_period = seconds(0.3)
brightness = 0
brightness_time = 0
brightness_period = seconds(1.5)
