/// @description Creation
hspeed = type_create
vspeed = area_vspeed * 0.75

arm_number = 5
arm_properties = array_create(arm_number, 0)

for (var i = 0; i < arm_number; ++i)
	arm_properties[0] = [enemy_create(enemy_arm_turret_1, x, y, choose(225, 270, 315), 0, id, "Instances_Arms"), -sprite_xoffset + i * 132 + 66, 0]
