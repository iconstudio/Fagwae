/// @description 

var inst = instance_create_depth(x, y, depth + 1, oParticleFlameSmoke)
inst.direction = direction + random(60) - 30
inst.vspeed = random(speed / 2) + speed / 4

alarm[0] = 2 + random(2)
