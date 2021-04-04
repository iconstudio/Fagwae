/// @description trophy_check2()
/// @function trophy_check2
function trophy_check2() {
	if global.achievement_cleared[2]
		return true

	if global.log_deads >= 10 {
		return true
	}

	return false



}
