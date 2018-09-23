/// @description Getting damage

if other.pow <= 0 or dead or untargetable
	exit

if !invincible {
	hurt = other.pow
	var target = parent, targetprev
	while instance_exists(target) {
		targetprev = target
		target = target.parent
		if !instance_exists(target) and instance_exists(targetprev) {
			with targetprev {
				hurt = other.hurt * 0.333
				event_user(15)
			}
			break
		}
	}

	if global.extreme
		score += ceil(score_loot * 1.1)
	else
		score += score_loot
}

event_user(15)

gauge_update(id)

audio_play_sound(soundHitPlayer, 20, false)

with other
	event_user(0)
