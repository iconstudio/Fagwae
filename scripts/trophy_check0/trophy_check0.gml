/// @description trophy_check0()
/// @function trophy_check0
if global.achievement_cleared[0]
	return true

if global.playerscore >= 100000 {
	return true
}

return false
