/// @description Getting damage

if other.pow <= 0 or dead
	exit

hurt = other.pow
event_user(15)

audio_play_sound(soundHitPlayer, 20, false)

with other
	event_user(0)
