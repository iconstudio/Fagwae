/// @description trophy_check8()
/// @function trophy_check8
if global.achievement_cleared[8]
	return true

if !global.extreme and global.stage == 6 {
	return true
}

return false
