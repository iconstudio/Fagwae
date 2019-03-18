/// @description trophy_check9()
/// @function trophy_check9
if global.achievement_cleared[9]
	return true

if !global.extreme and global.stage == 6 and game_session_get_dead() == 0 {
	return true
}

return false
