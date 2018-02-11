/// @description enemy_create(type, x, y, [type_create], [image_angle], [parent])
/// @function enemy_create
/// @param type { string }
/// @param x { real }
/// @param y { real }
/// @param [type_create] { integer }
/// @param [image_angle] { real }
/// @param [parent] { instance }

var attributes = ds_map_find_value(global.enemy_dictionary, argument[0])
if !is_array(attributes)
	show_error("Error when getting enemy attributes", true)

with instance_create_layer(argument[1], argument[2], "Instances", oDummy) {
	sprite_normal = attributes[2]
	sprite_extreme = attributes[3]
	rotation_step = attributes[7]
	if argument_count >= 4
		type_create = argument[3]

	instance_change(attributes[0], true)

	name = attributes[1]
	hp = attributes[4]
	hp_max = attributes[4]
	score_dead = attributes[5]
	score_loot = attributes[6]
	if global.extreme
		sprite_index = sprite_extremes
	else
		sprite_index = sprite_normal

	if argument_count >= 6
		parent = argument[5]
	if argument_count >= 5
		image_angle = argument[4]
	//show_debug_message("Object: " + object_get_name(attributes[0]) + ", Name: " + name + ", Type of creation: " + string(type_create))
	//show_debug_message("Score: " + string(score_dead) + ", Loot: " + string(score_loot))
	//show_debug_message("hp: " + string(hp) + ", Sprite: " + sprite_get_name(sprite_normal))
	return id
}
