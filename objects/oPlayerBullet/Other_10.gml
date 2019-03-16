repeat 1 + irandom(1) {
	with instance_create_layer(x, y, "Effect", oParticleFlameBlue) {
		hspeed = random(6) - 3
		vspeed = random(2) + 2
	}
}
instance_destroy()
