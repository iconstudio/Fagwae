/// @description 

if smode == 0 {
 vspeed += (0.5 - vspeed) / 12
} else {
	if speed < 2
		speed += 0.03
	if y < global.py - 64
		direction = min(max(225, direction + get_rotation_next(direction, point_direction(x, y, global.px, global.py), 0.5)), 315)
}
pangle += 1.5