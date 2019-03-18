/// @description Creation
turret = enemy_create(enemy_arm_turret_d, x, y, floor(random(360) * 0.125) * 45, 0, id, "Instances_Arms")
turret.parent = id

hspeed = type_create
vspeed = 1
