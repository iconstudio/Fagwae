/// @description achievement_add(caption, description, updater)
/// @function achievement_add
/// @param caption { string }
/// @param description { string }
/// @param updater { script }

global.achievement[global.achievement_count] = 0
global.achievement_cleared[global.achievement_count] = false
global.achievement_caption[global.achievement_count] = argument0
global.achievement_description[global.achievement_count] = argument1
global.achievement_updater[global.achievement_count] = argument2

return global.achievement_count++
