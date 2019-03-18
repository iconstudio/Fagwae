/// @description trophy_check7()
/// @function trophy_check7
if global.achievement_cleared[7]
	return true

if !global.extreme and global.stage == 4 {
	return true
}

return false
