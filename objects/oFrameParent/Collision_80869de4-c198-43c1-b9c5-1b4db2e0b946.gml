/// @description Collide with other bullets

if other.parent == id {
	exit
} else if other.parent != noone {
	var parent_hiearach = other.parent, parent_previous = other.parent
	while true {
		parent_previous = parent_hiearach
		parent_hiearach = parent_hiearach.parent
		if parent_hiearach == noone {
			break
		}
	}
	if parent_previous == id
		exit
}

with other {
	hspeed = other.hspeed
	vspeed = other.vspeed

	event_user(0)
}
