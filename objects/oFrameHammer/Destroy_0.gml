with bar {
	hspeed = random(4) - 2
	vspeed = -random(4) - 5
	if !global.extreme
		speed *= 0.5
	image_angle = direction
	gravity_direction = 270
	gravity = 0.1
	invincible = false
}
