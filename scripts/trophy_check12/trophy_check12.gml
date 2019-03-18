/// @description trophy_check12()
/// @function trophy_check12
if global.achievement_cleared[7]
	return true

if global.extreme and global.stage == 4 {
	return true
}

return false
