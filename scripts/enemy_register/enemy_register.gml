/// @description enemy_register(type, object, name, sprite_normal, sprite_extreme, hp, score, score_loot, rotation, polygon_number, color_normal, color_extreme)
/// @function enemy_register
/// @param type { string }
/// @param object { object }
/// @param name { string }
/// @param sprite_normal { sprite }
/// @param sprite_extreme { sprite }
/// @param hp { real }
/// @param score { real }
/// @param score_loot { real }
/// @param rotation { real }
/// @param polygon_number { integer }
/// @param color_normal { real }
/// @param color_extreme { real }

if argument_count < 9
	show_error("Error when registering an enemy!\nName: " + string(argument[2]), true)
/*
show_debug_message("Object: " + object_get_name(argument[1]) + ", Name: " + argument[2])
show_debug_message("Sprite: " + sprite_get_name(argument[3]) + ", SpriteEx: " + sprite_get_name(argument[4]))
show_debug_message("HP: " + string(argument[5]) + ", Score: " + string(argument[6]) + ", Loot: " + string(argument[7]))
if argument_count >= 10 {
	show_debug_message("color: " + string(argument[10]) + ", colorEx: " + string(argument[11]) + ", poly: " + string(argument[9]))
}
*/

var data = array_create(11, 0)
for (var i = 0; i < 11; ++i) {
	if argument_count >= i
		data[i] = argument[i + 1]
}

return ds_map_add(global.enemy_dictionary, argument[0], data)
