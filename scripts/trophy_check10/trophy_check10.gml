/// @description trophy_check10()
/// @function trophy_check10
if global.achievement_cleared[10]
	return true

if global.playerscore >= 500000 {
	return true
}

return false
