/// @description Tracking player of going down

if y > room_height + 10
	instance_destroy()

image_angle++
if enable {
	if homing {
		if !global.playeralive {
			homing = false
			exit
		}
		direction = point_direction(x, y, global.px, global.py)
		speed = 16
	} else if global.playeralive {
		if point_distance(x, y, global.px, global.py) <= 144
			homing = true
	}
}

if homing {
	gravity = 0
} else {
	gravity = 0.3
	if vspeed > 4
		vspeed = 4
}
