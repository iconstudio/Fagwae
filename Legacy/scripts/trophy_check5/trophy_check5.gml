/// @description trophy_check5()
/// @function trophy_check5
function trophy_check5() {
	if global.achievement_cleared[5]
		return true

	if global.log_kills >= 400 {
		return true
	}

	return false



}
