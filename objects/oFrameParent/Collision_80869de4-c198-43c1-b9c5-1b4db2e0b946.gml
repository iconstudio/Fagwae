/// @description Collide with other bullets
if other.parent == id {
	exit
} else if instance_exists(other.parent) {
	var parent_hiearach = other.parent
	while true {
		if !instance_exists(parent_hiearach)
			break
		else if parent_hiearach == id
			exit
		parent_hiearach = parent_hiearach.parent
	}
}

with other {
	hspeed = other.hspeed
	vspeed = other.vspeed

	event_user(0)
}
