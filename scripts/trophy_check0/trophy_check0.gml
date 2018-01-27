/// @description trophy_check0(index)
/// @function trophy_check0
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if global.dead_local >= 15 {
	return true
}

return false
