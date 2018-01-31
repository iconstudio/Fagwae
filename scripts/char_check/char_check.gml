/// @description char_check(char)
/// @function char_check
/// @param char { char }

return !(argument0 < 32 or argument0 > 95 or (argument0 > 33 and argument0 < 45) or (argument0 > 57 and argument0 < 65))
