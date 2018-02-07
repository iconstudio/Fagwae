/// @description 

if invincible > 0 or other.dead
	exit

event_user(1) // get damaged

audio_play_sound(soundCollisionPlayer, 20, false)

with other
	event_perform(ev_collision, oPlayerCollision)
