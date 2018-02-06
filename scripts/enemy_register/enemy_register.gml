/// @description enemy_register(type, object, name, sprite_normal, sprite_extreme, hp, score, score_loot, rotation)
/// @function enemy_register
/// @param type { string }
/// @param object { object }
/// @param name { string }
/// @param sprite_normal { sprite }
/// @param sprite_extreme { sprite }
/// @param hp { integer }
/// @param score { real }
/// @param score_loot { real }
/// @param rotation { real }

var data = array_create(8)
data[0] = argument1
data[1] = argument2
data[2] = argument3
data[3] = argument4
data[4] = argument5
data[5] = argument6
data[6] = argument7
data[7] = argument8

return ds_map_add(global.enemy_dictionary, argument0, data)
