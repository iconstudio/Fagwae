/// @description Dying
enemy_arm_explode()

dead = true
//show_polygon(x, y, 6, 160, polycol, polygon)
enemy_explode(25, 256, 9, 9)

if global.extreme
	instance_create_layer(x, y, "Player", oPlayerLife)

instance_destroy()
