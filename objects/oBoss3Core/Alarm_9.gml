/// @description Dying
enemy_explode(32, 300, 10, 12)

if global.extreme
	instance_create_layer(x, y, "Player", oPlayerLife)

instance_destroy()
