/// @description Update

event_inherited()

if vspeed != speed_target
	vspeed += (speed_target - vspeed) / 3

enemy_arm_fix()
