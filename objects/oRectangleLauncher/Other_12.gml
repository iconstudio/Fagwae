/// @description Update
event_inherited()

if vspeed != vspeed_target
	vspeed += (vspeed_target - vspeed) * 0.666

enemy_arm_fix()
