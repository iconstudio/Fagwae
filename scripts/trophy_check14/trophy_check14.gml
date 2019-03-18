/// @description trophy_check14()
/// @function trophy_check14
if global.achievement_cleared[14]
	return true

if global.extreme and global.stage == 6 and game_session_get_dead() == 0 {
	return true
}

return false
