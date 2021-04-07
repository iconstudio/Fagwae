/// @description Execute a menu
var Target = global.main_depth.get_focus()
if Target != null and Target != global.main_depth {
	if Target.__openable and 0 < Target.get_size() {
		global.main_depth_stack.push_back(Target)
		global.main_depth_previous = global.main_depth
		global.main_depth = Target
		Target.do_open()
	}

	Target.execute()
}
