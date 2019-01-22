/// @description trophy_check4(index)
/// @function trophy_check4
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if global.playerscore >= 500000 {
	return true
}

return false
