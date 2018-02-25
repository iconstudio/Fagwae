/// @description 

if moving_mode != 0 {
	if y < global.py - 16
		direction = min(max(200, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 1.5)), 340)
}

if speed != 0 {
	speed -= speed / 3
}
