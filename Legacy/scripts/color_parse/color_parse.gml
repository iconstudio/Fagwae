/// @description color_parse(color)
/// @function color_parse
/// @param color { real }
function color_parse(argument0) {
	var color = argument0
	while 255 < color
		color -= 255
	while color < 0
		color += 255

	return color



}
