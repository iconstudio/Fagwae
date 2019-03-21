/// @description enemy_create(type, x, y, [type_create], [image_angle], [parent], [layer])
/// @function enemy_create
/// @param type { string }
/// @param x { real }
/// @param y { real }
/// @param [type_create] { integer }
/// @param [image_angle] { real }
/// @param [parent] { instance }
/// @param [layer] { layer }
var attributes = ds_map_find_value(global.enemy_dictionary, argument[0])
if !is_array(attributes)
	show_error("Error when getting enemy attributes", true)

var __layer = "Instances"
if argument_count >= 7
	__layer = argument[6]

var sprites = attributes[2]
with instance_create_layer(argument[1], argument[2], __layer, oDummy) {
	sprite_normal = sprites[0]
	sprite_extreme = sprites[1]
	rotation_step = attributes[6]
	if argument_count >= 4
		type_create = argument[3]

	polygon = attributes[7]
	if global.extreme
		polygon_color = attributes[9]
	else
		polygon_color = attributes[98]

	if argument_count >= 5
		image_angle = argument[4]
	if argument_count >= 6
		parent = argument[5]

	instance_change(attributes[0], true)
	
	if argument_count >= 6
		parent = argument[5]
	hp = attributes[3]
	hp_max = attributes[3]
	score_dead = attributes[4]
	score_loot = attributes[5]
	if global.extreme
		sprite_index = sprite_extreme
	else
		sprite_index = sprite_normal

	//show_debug_message("Object: " + object_get_name(attributes[0]) + ", Name: " + name + ", Type of creation: " + string(type_create))
	//show_debug_message("Score: " + string(score_dead) + ", Loot: " + string(score_loot))
	//show_debug_message("hp: " + string(hp) + ", Sprite: " + sprite_get_name(sprite_normal))
	return id
}
