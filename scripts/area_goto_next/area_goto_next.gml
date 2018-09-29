/// @description area_goto_next()
/// @function area_goto_next

global.stage++
with instance_create_layer(0,  0, "Backend", next){
	// from shape to the frame
	if other.object_index == oStageShape {
		back_color = other.back_color
		square_saturation = other.square_saturation
		back_count = other.back_count
	}
	// from frame to the indeterminates
	else if other.object_index == oStageFrame {
		
	}
	// indeterminates
	else {
		
	}

	back_alpha = other.back_alpha
	background_param = other.background_param
	scroll = other.scroll
	rotation = other.rotation
	brightness = other.brightness
}

instance_destroy()
