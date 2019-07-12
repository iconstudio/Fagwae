/// @description Update
if parent.pattern == 0 {
	image_xscale = beat_xscale + beat_xscale_addition * parent.pattern00_time / parent.pattern00_period
} else {
	image_xscale = beat_xscale
}

arm = arm_properties[0]

if instance_exists(arm[0]) {
	speed = arm[1] * image_xscale / beat_xscale
	direction = arm[2] + image_angle
	arm[0].x += (x + hspeed - arm[0].x) * 0.5
	arm[0].y += (y + vspeed - arm[0].y) * 0.5
	arm[0].image_angle = direction
	speed = 0
	direction = 0
}


