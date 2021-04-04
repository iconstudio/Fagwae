/// @description score_add(value)
/// @function score_add
/// @param value { integer }
function score_add(argument0) {
	with oScore {
		score_previous = global.playerscore
		score_increase_time = 0
	}
	global.playerscore += argument0



}
