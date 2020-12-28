/// @description trophy_check4()
/// @function trophy_check4
function trophy_check4() {
	if global.achievement_cleared[4]
		return true

	if global.log_kills >= 150 {
		return true
	}

	return false



}
