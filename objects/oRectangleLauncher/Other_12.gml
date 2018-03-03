/// @description Update

event_inherited()

if vspeed != speed_target
	vspeed += (speed_target - vspeed) * 0.333

enemy_arm_fix()
