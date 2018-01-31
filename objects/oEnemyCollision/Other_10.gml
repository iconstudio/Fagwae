/// @description 

with instance_create_depth(x, y, depth, object_dead) {
	motion_set(other.direction, other.speed)
	image_angle = other.image_angle
}

instance_destroy()
