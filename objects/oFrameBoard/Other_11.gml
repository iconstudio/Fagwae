/// @description Creation

turret_instances = array_create(5, noone)

var csx = x - 329, cx = csx + 64
for (var i = 0; i < 5; ++i) {
	turret_instances[i] = enemy_create(enemy_arm_turret_1, cx, y, floor(random(360) * 0.25) * 45, 0, id, "Instances_Arms")
}

hspeed = type_create
vspeed = 1
