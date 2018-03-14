/// @description Reflecting

if other.pow <= 0 or dead
	exit

if irandom(3) == 0 {
	if other.x == x or irandom(2) == 0 {
		with other
			direction += 180
	} else if other.x < x {
		direction = 270 - direction
	} else if other.x > x {
		direction = 90 + direction
	} else {
		with other
			direction += 180
	}

	with other {
		direction += random_range(-20, 20)
		image_angle = direction - 90
		x += hspeed
		y += vspeed
	}
	
} else {
	with other
		event_user(0)
}

audio_play_sound(soundHitPlayer, 20, false)
