/// @description profile_load(file)
/// @function profile_load
/// @param file { string }

global.achievement = []
global.achievement_count = 5

if !file_exists(argument0)
 return false

var buffer = buffer_load(argument0)
if buffer_exists(buffer) or !buffer
 return false

var result = profile_load_begin(buffer)

buffer_delete(buffer)

return result
