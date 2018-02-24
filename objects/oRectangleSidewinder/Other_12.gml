/// @description Update

event_inherited()

if vspeed != 1.5
	vspeed += (1.5 - vspeed) / 12

enemy_arm_fix(pangle)
