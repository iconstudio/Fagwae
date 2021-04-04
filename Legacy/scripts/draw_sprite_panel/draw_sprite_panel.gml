/// @description draw_sprite_panel(sprite,subimg,x,y,left,top,right,bottom,width,height)
/// @function draw_sprite_panel
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param left
/// @param top
/// @param right
/// @param bottom
/// @param width
/// @param height
function draw_sprite_panel(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	var source_width = sprite_get_width(argument0);
	var source_height = sprite_get_height(argument0);
	var right = source_width - argument6;
	var bottom = source_height - argument7;
	var inner_width = right - argument4;
	var inner_height = bottom - argument5;
	var scale_x = (argument8 - argument4 - argument6) / inner_width;
	var scale_y = (argument9 - argument5 - argument7) / inner_height;
	var color = draw_get_colour();
	var alpha = draw_get_alpha();

	// Top
	draw_sprite_part_ext(argument0, argument1, 0, 0, argument4, argument5, argument2, argument3, 1, 1, color, alpha);

	if 0 < scale_x
		draw_sprite_part_ext(argument0, argument1, argument4, 0, inner_width, argument5, argument2 + argument4, argument3, scale_x, 1, color, alpha);

	draw_sprite_part_ext(argument0, argument1, right, 0, argument6, argument5, argument2 + argument8 - argument6, argument3, 1, 1, color, alpha);

	// Middle
	if 0 < scale_y {
		draw_sprite_part_ext(argument0, argument1, 0, argument5, argument4, inner_height, argument2, argument3 + argument5, 1, scale_y, color, alpha);

		if 0 < scale_x
			draw_sprite_part_ext(argument0, argument1, argument4, argument5, inner_width, inner_height, argument2 + argument4, argument3 + argument5, scale_x, scale_y, color, alpha);

		draw_sprite_part_ext(argument0, argument1, right, argument5, argument6, inner_height, argument2 + argument8 - argument6, argument3 + argument5, 1, scale_y, color, alpha);
	}

	// Bottom
	draw_sprite_part_ext(argument0, argument1, 0, bottom, argument4, argument7, argument2, argument3 + argument9 - argument7, 1, 1, color, alpha);

	if 0 < scale_x
		draw_sprite_part_ext(argument0, argument1, argument4, bottom, inner_width, argument7, argument2 + argument4, argument3 + argument9 - argument7, scale_x, 1, color, alpha);

	draw_sprite_part_ext(argument0, argument1, right, bottom, argument6, argument7, argument2 + argument8 - argument6, argument3 + argument9 - argument7, 1, 1, color, alpha);


}
