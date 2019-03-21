/// @description Getting damage
if other.pow <= 0 or dead
	exit

with other
	event_user(0)

if untargetable
	exit

var hierachy = gauge_update(id)
hurt = other.pow
if invincible < INVINCIBLE_HARD and hierachy != id {
	with hierachy {
		hurt = other.hurt * other.hurt_upper_ratio
		event_user(15)
	}
}
/*if invincible < INVINCIBLE_HARD {
	var hierachy = parent, hierachy_previous
	while instance_exists(hierachy) {
		hierachy_previous = hierachy
		hierachy = hierachy.parent
		if !instance_exists(hierachy) and instance_exists(hierachy_previous) {
			with hierachy_previous {
				hurt = other.hurt * other.hurt_upper_ratio
				event_user(15)
			}
			break
		}
	}
}*/

if invincible < INVINCIBLE_FULL {
	if global.extreme
		global.playerscore += ceil(score_loot * 1.1)
	else
		global.playerscore += score_loot
}
if invincible > INVINCIBLE_NONE
	hurt = 0

if invincible < INVINCIBLE_HARD
	event_user(15)

audio_play_sound(soundHitPlayer, 20, false)
