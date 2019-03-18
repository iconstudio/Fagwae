/// @description trophy_check1()
/// @function trophy_check1
if global.achievement_cleared[1]
	return true

if global.log_deads >= 1 {
	return true
}

return false
