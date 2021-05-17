/// @function fagwae_score_add(score)
function fagwae_score_add(value) {
	with oGameScore
		add(value)
}


/// @function seconds(time)
function seconds(time) {
	return time * GAME_FPS
}


/// @function realforce(speed)
function realforce(speed) {
	return speed / GAME_FPS
}

