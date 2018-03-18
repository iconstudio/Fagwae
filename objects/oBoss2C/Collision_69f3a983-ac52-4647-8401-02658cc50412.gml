/// @description Ignoring damage

if other.pow <= 0 or dead
	exit

hurt = other.pow
if instance_exists(parent) {
	with parent {
		hurt = other.hurt * 0.333
		event_user(15)
	}
}

damaged = 1

if global.extreme
	score += ceil(score_loot * 1.1)
else
	score += score_loot

gauge_update(id)

audio_play_sound(soundHitPlayer, 20, false)

with other
	event_user(0)
