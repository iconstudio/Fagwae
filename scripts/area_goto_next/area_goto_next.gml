/// @description area_goto_next()
/// @function area_goto_next

with instance_create_layer(0,  0, "Backend", global.area_list[global.stage++]){
	var name_parent = object_get_name(object_get_parent(object_index))
	
	// shapes
	if name_parent == "oStageShapeParent" {
		back_color = other.back_color
		square_saturation = other.square_saturation
	}
	// frames
	if name_parent == "oStageFrameParent" {
		
	}
	
	// indeterminates

	back_alpha = other.back_alpha
	background_param = other.background_param
	scroll = other.scroll
	rotation = other.rotation
	brightness = other.brightness
}

instance_destroy()
