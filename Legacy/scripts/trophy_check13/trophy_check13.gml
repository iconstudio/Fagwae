/// @description trophy_check13()
/// @function trophy_check13
function trophy_check13() {
	if global.achievement_cleared[13]
		return true

	if global.extreme and global.stage == 6 {
		return true
	}

	return false



}
