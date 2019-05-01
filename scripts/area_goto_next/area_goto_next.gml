/// @description area_goto_next()
/// @function area_goto_next
with instance_create_layer(0,  0, "Backend", next){
	// from shape to the frame
	if other.object_index == oStageShape {
		back_color = other.back_color
		back_count = other.back_count
	}
	// from frame to the indeterminates
	else if other.object_index == oStageFrame {
		
	}
	// indeterminates
	else {
		
	}
	background_param = other.background_param
	scroll = other.scroll
	rotation = other.rotation
	brightness = other.brightness
}
instance_destroy()
