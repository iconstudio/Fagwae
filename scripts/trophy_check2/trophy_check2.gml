/// @description trophy_check2(index)
/// @function trophy_check2
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if !global.extreme and global.stage == 10 {
	return true
}

return false
