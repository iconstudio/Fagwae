/// @description Creation
name = "HAMMER"

head = enemy_create(enemy_arm_hammerhead, x, y, 0, 0, id, "Instances_Arms_Above")
head.image_angle = image_angle + 90
head.depth -= 1
head.parent = id

velocity_max = player_vspeed * 1.5

rotation_step *= type_create
invincible = INVINCIBLE_PARENTAL
