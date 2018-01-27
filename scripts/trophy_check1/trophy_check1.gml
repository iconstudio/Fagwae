/// @description trophy_check1(index)
/// @function trophy_check1
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if score >= 100000 {
	return true
}

return false
