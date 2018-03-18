/// @description area_goto_next()
/// @function area_goto_next

var area = noone
with oStageParent
	area = id

with instance_create_layer(x, y, "Backend", global.area_list[++global.stage]){
	back_color = area.back_color
	square_saturation = area.square_saturation

	back_alpha = area.back_alpha
	background_param = area.background_param
	scroll = area.scroll
	rotation = area.rotation
	brightness = area.brightness
}

with area
	instance_destroy()
