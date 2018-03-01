/// @description Collide with other bullets

if other.parent == id
	exit

with other {
	hspeed = other.hspeed
	vspeed = other.vspeed

	event_user(0)
}
