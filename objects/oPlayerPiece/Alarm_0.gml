/// @description 

with instance_create_layer(x, y, layer, oParticleFlameSmoke) {
	direction = other.direction + random(60) - 30
	vspeed = random(other.speed * 0.5) + other.speed * 0.25
}

alarm[0] = 2 + random(2)
