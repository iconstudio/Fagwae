/// @description trophy_check11()
/// @function trophy_check11
if global.achievement_cleared[6]
	return true

if global.extreme and global.stage == 2 {
	return true
}

return false
