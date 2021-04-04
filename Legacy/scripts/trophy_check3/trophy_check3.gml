/// @description trophy_check3()
/// @function trophy_check3
function trophy_check3() {
	if global.achievement_cleared[3]
		return true

	if global.log_kills >= 50 {
		return true
	}

	return false



}
