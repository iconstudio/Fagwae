/// @description Go back
global.main_depth_stack.pop()

if 0 < global.main_depth_stack.size() {
	global.main_depth = global.main_depth_stack.back()
} else {
	global.main_depth = id
}
