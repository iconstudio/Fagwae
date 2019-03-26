/// @description trophy_check1()
/// @function trophy_check1
if global.achievement_cleared[1]
	return true

if game_session_get_dead() >= 1 {
	return true
}

return false
