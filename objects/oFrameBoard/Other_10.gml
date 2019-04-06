/// @description Dying
for (var i = 0; i < 5; ++i)
	enemy_explode(4, 45, 2 + irandom(1), 1, -sprite_xoffset + i * 132 + 66)

instance_destroy()
