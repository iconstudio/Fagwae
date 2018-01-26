/// @description achievement_add(caption, description)
/// @function achievement_add
/// @param caption { string }
/// @param description { string }

global.achievement[global.achievement_count] = 0
global.achievement_caption[global.achievement_count] = argument0
global.achievement_description[global.achievement_count] = argument1

return global.achievement_count++
