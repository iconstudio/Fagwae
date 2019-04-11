/// @description Dying
enemy_arm_explode()
with glove_left
	event_user(0)
with glove_right
	event_user(0)

dead = true
//show_polygon(x, y, 6, 160, polycol, polygon)
enemy_explode(30, 256, 9, 9)

if global.extreme
	instance_create_layer(x, y, "Player", oPlayerLife)

instance_destroy()
