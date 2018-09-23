/// @description Creation

vspeed_max = 5 - global.extreme
gravity = 0.4
gravity_direction = 270

image_angle = random(360)

var shot_direction = random(50)
var distance = abs(global.px - x)
var velocity = sqrt(distance * 0.4 / (2 * lengthdir_x(1, shot_direction) * lengthdir_y(1, shot_direction)))
if abs(global.py - y) < 4 + global.extreme { // same line
	if global.extreme {
		if irandom(3) == 0 {
			speed = velocity
			direction = shot_direction
		} else {
			speed = velocity
			direction = shot_direction + random(20) - 10
		}
	} else {
		if irandom(7 + instance_number(oFrameParent)) == 0 {
			speed = max(1, velocity + random(3) - 1.5)
			direction = shot_direction + random(20) - 10
		} else {
			speed = max(1, velocity + random(6) - 4)
			direction = shot_direction + random(30) - 15
		}
	}
} else if global.py > y { // under line
	var shot_dir_gab = (global.py - y)
	if global.extreme {
		if irandom(3) == 0 {
			speed = velocity
			direction = shot_direction
			var htime = distance / hspeed
			vspeed = shot_dir_gab / htime
		} else {
			speed = velocity
			direction = shot_direction + random(20) - 10
			var htime = distance / hspeed
			hspeed += random(2) - 1
			vspeed = shot_dir_gab / htime + random(4) - 2
		}
	} else {
		speed = velocity
		direction = shot_direction + random(20) - 10
		hspeed *= random_range(0.1, 0.7)
	}
} else { // upper line
	var shot_dir_gab = global.py - y
	if global.extreme {
		if irandom(3) == 0 {
			speed = velocity
			direction = shot_direction
			var htime = distance / hspeed
			vspeed = shot_dir_gab / htime - 2
		} else {
			speed = velocity
			direction = shot_direction + random(20) - 10
			var htime = distance / hspeed
			hspeed = max(1, hspeed + random(2) - 1)
			vspeed = shot_dir_gab / htime + random(4) - 4
		}
	} else {
		hspeed = random_range(2, 8)
		vspeed = -2 - random(2)
	}
}

if type_create == LEFT {
	x = -20
} else if type_create == RIGHT {
	x = view_width + 20
	rotation_step *= -1
	hspeed *= -1
}
