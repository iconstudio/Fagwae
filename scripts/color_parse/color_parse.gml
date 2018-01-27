/// @description color_parse(color)
/// @function color_parse
/// @param color { real }

var color = argument0
while color > 255
	color -= 255
while color < 0
	color += 255

return color
