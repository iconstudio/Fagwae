/// @description 

var inst
repeat 1 + irandom(1) {
	inst = instance_create_depth(x, y, depth + 1, oParticleFlameBlue)
	inst.hspeed = random(6) - 3
	inst.vspeed = random(2) + 2
}
instance_destroy()
