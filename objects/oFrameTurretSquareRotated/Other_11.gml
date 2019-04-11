/// @description Creation
turret = enemy_create(enemy_arm_turret_1, x, y, floor(random(360) * 0.255) * 45, 0, id, "Instances_Arms")
turret.parent = id

image_angle = random(360)
hspeed = type_create * 0.6
vspeed = area_vspeed * 0.75
