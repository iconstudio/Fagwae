/// @description ui_take_center([ui])
/// @param [ui] instance

var target = id
if argument_count > 0 {
	target = argument[0]
}
with target {
	x = round(ui_parent.x + ui_parent.ui_width * 0.5 - ui_width * 0.5)
	y = round(ui_parent.y + ui_parent.ui_height * 0.5 - ui_height * 0.5)
}
