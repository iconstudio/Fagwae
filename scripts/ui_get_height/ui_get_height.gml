/// @description ui_get_height([id])
/// @param [ui] instance

var target = id
if argument_count > 0 {
	target = argument[0]
}
with target
	return ui_height
