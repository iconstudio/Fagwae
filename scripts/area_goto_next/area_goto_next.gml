/// @description area_goto_next()
/// @function area_goto_next

var area = noone
with oStageParent
	area = id

with instance_create_layer(0,  0, "Backend", global.area_list[global.stage++]){
	var name_parent = object_get_name(object_get_parent(object_index))
	
	// shapes
	if name_parent == "oStageShapeParent" {
		back_color = area.back_color
		square_saturation = area.square_saturation
	}
	// frames
	if name_parent == "oStageFrameParent" {
		
	}
	
	// indeterminates

	back_alpha = area.back_alpha
	background_param = area.background_param
	scroll = area.scroll
	rotation = area.rotation
	brightness = area.brightness
}

with area
	instance_destroy()
