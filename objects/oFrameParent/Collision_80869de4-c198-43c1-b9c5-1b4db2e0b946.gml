/// @description Collide with other bullets
if other.parent == id {
	show_debug_message("HOW DARE!")
	exit
} else {
	var parent_hiearach = parent
	while true {
		if !instance_exists(parent_hiearach) {
			show_debug_message("NOPE!")
			break
		} else if other.parent == parent_hiearach {
			show_debug_message("PROFIT!")
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
