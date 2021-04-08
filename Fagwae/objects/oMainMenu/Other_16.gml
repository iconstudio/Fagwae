/// @description Go back
if global.main_depth != id {
	var Prior = global.main_depth.__parent
	Prior.select(null)
	global.main_depth = Prior
}
