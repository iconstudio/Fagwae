/// @description score_add(value)
/// @function score_add
/// @param value { integer }
with oScore {
	score_previous = global.playerscore
	score_increase_time = 0
}
global.playerscore += argument0
