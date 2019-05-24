/// @description Creation
turret = enemy_create(enemy_arm_hammer, x, y, choose(-1, 1), 0, id, "Instances_Arms")
turret.parent = id

hspeed = type_create * 0.6
vspeed = area_vspeed * 0.75
