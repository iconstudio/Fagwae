/// @function fagwae_score_add(score)
function fagwae_score_add(value) {
	with oGameScore
		add(value)
}


/// @function fagwae_enemy_arms_remove()
function fagwae_enemy_arms_remove() {
	if !is_null(arms) {
		arms.foreach_all(instance_destroy)
	}
}


/// @function fagwae_enemy_arms_destroy()
function fagwae_enemy_arms_destroy() {
	static destroyer = function(target) {
		with target {
			hp = 0
			dead = true
			event_user(0)
		}
	}


	if !is_null(arms) {
		arms.foreach_all(destroyer)
	}
}


/// @function seconds(time)
function seconds(time) {
	return time * GAME_FPS
}


/// @function realforce(speed)
function realforce(speed) {
	return speed / GAME_FPS
}

