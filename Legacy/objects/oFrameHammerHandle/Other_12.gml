/// @description Update
event_inherited()

with head {
	x = other.x + lengthdir_x(44, other.image_angle)
	y = other.y + lengthdir_y(44, other.image_angle)
	image_angle = other.image_angle + 90
}

with parent
	damaged = other.damaged

if vspeed > velocity_max
	vspeed = velocity_max
