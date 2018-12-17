/// @description Creation

bar = enemy_create(enemy_arm_handle, x, y, type_create, 0, id, "Instances_Arms_Above")
bar.image_angle = floor(random(360) * 0.125) * 45
bar.parent = id

untargetable = true
