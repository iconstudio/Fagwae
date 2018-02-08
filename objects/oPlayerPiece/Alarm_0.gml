/// @description 

with instance_create_depth(x, y, depth + 1, oParticleFlameSmoke) {
	direction = other.direction + random(60) - 30
	vspeed = random(other.speed / 2) + other.speed / 4
}

alarm[0] = 2 + random(2)
