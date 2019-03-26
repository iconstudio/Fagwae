/// @description enemy_register_general(type, object, sprites, hp, score_die, score_loot, rotation, polygon_number, color_normal, color_extreme)
/// @function enemy_register_general
/// @param type { string }
/// @param object { object }
/// @param sprites { array }
/// @param hp { real }
/// @param score_die { real }
/// @param score_loot { real }
/// @param rotation { real }
/// @param polygon_number { integer }
/// @param color_normal { real }
/// @param color_extreme { real }
/*
show_debug_message("Object: " + object_get_name(argument[1]) + ", Name: " + argument[2])
show_debug_message("Sprite: " + sprite_get_name(argument[3]) + ", SpriteEx: " + sprite_get_name(argument[4]))
show_debug_message("HP: " + string(argument[5]) + ", Score: " + string(argument[6]) + ", Loot: " + string(argument[7]))
if argument_count >= 10 {
	show_debug_message("color: " + string(argument[10]) + ", colorEx: " + string(argument[11]) + ", poly: " + string(argument[9]))
}
*/

//					0object		1sprites	2hp			3score_die	4score_loot 5rotation 6polygons		
var data = [argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9]
return ds_map_add(global.enemy_dictionary, argument0, data)
