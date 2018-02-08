/// @description Getting damage

if other.pow <= 0 or dead
	exit

hurt = other.pow
if instance_exists(parent) {
	with parent {
		hurt = other.hurt / 3
		event_user(15)
	}
}
event_user(15)

gauge_update(id)

audio_play_sound(soundHitPlayer, 20, false)

with other
	event_user(0)
