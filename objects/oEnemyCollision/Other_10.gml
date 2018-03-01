/// @description 

if object_dead != noone {
	with instance_create_layer(x, y, "Bullet_Effect", object_dead) {
		motion_set(other.direction, other.speed)
		image_angle = other.image_angle
	}
}

instance_destroy()
