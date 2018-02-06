/// @description 

var inst
repeat 1 + irandom(1) {
	with instance_create_depth(x, y, depth + 1, oParticleFlameBlue) {
		hspeed = random(6) - 3
		vspeed = random(2) + 2
	}
}
instance_destroy()
