/// @description Collide with other bullets
if other.parent == id {
	exit
} else {
	var parent_hiearach = parent
	while true {
		if !instance_exists(parent_hiearach) {
			break
		} else if other.parent == parent_hiearach {
			exit
		}
		parent_hiearach = parent_hiearach.parent
	}
}

with other {
	hspeed = other.hspeed
	vspeed = other.vspeed

	event_user(0)
}