/// @description Execute
var Target = global.main_depth.__child_focus
if Target != null {
	global.main_depth_stack.push(Target)
	global.main_depth = Target
}
