/// @description trophy_check5(index)
/// @function trophy_check5
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if global.extreme and global.stage == 10 and global.dead_local == 0 {
	return true
}

return false
