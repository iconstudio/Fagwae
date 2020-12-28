/// @description enemy_register(type, object, sprites, hp, score_die, score_loot, rotation)
/// @function enemy_register
/// @param type { string }
/// @param object { object }
/// @param sprites { array }
/// @param hp { real }
/// @param score_die { real }
/// @param score_loot { real }
/// @param rotation { real }
function enemy_register(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var sprites = argument2
	if !is_array(argument2) {
		if !sprite_exists(argument2) {
			var orgsprite = object_get_sprite(argument1)
			sprites = [orgsprite, orgsprite]
		} else if sprite_exists(argument2) {
			sprites = [argument2, argument2]
		} else {
			show_error("Error when adding sprites to a enemy!\nName: " + argument0, true)
		}
	}

	return enemy_register_general(argument0, argument1, sprites, argument3, argument4, argument5, argument6, undefined, undefined, undefined)



}
