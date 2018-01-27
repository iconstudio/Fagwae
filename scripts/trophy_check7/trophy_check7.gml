/// @description trophy_check7(index)
/// @function trophy_check7
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if global.framekill_local >= 30 {
	return true
}

return false
