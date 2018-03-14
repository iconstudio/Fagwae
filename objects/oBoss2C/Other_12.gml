/// @description Update

if instance_exists(parent) and !dead {
	if pattern == 0 {
		x = parent.x + x_fix
		y = parent.y + y_fix
	}
}

event_inherited()
