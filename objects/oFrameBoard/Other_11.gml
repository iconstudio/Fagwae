/// @description Creation
hspeed = type_create
vspeed = area_vspeed * 0.75

arm_instances = []
for (var i = 0; i < 5; ++i) {
	arm_instances[i] = enemy_create(enemy_arm_turret_1, x - sprite_xoffset + i * 132 + 66, y, choose(225, 270, 315))
	arm_instances[i].parent = id
}
