if 0 < invincible or other.dead or other.untargetable or other.INVINCIBLE_HARD < other.invincible
	exit

event_user(1) // get damaged

audio_play_sound(soundCollisionPlayer, 20, false)

with other
	event_perform(ev_collision, oPlayerCollision)
