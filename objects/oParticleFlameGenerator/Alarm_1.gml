/// @description 

with instance_create_depth(x, y, depth + 5, oParticleFlameSmoke) {
	direction = other.direction + random(30) - 15
	speed = other.speed * 0.75
	frame += random(other.rrat / 2)
}

alarm[1] = 1 + rrat * 1.2
rrat += 0.15
