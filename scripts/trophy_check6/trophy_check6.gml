/// @description trophy_check6()
/// @function trophy_check6
if global.achievement_cleared[6]
	return true

if !global.extreme and global.stage == 2 {
	return true
}

return false
