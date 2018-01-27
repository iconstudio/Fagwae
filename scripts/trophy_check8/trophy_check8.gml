/// @description trophy_check8(index)
/// @function trophy_check8
/// @param index { integer }

if global.achievement_cleared[argument0]
	return true

if !global.achievement_getter[argument0]
	return false

if global.stage == 10 { // The availablity to get achievement is depends on achievement_getter
	return true
}

return false
