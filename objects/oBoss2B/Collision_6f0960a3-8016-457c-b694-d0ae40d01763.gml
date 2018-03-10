/// @description Reflecting

if other.pow <= 0 or dead
	exit

if irandom(3) == 0 {
	with other
		direction += 180
} else {
	hurt = other.pow
	if instance_exists(parent) {
		with parent {
			hurt = other.hurt * 0.333
			event_user(15)
		}
	}
	event_user(15)

	gauge_update(id)

	with other
		event_user(0)
}

audio_play_sound(soundHitPlayer, 20, false)
