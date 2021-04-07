/// @description Go back
var Pos = global.main_depth_stack.get_size()

global.main_depth_stack.pop_back()
if 1 < Pos {
	global.main_depth = global.main_depth_stack.back()
} else {
	global.main_depth = id
}
