/// @description Execute
var Target = global.main_depth.__child_focus
if Target != null {
	if Target.__openable and 0 < Target.__children.size() {
		global.main_depth_stack.push(Target)
		global.main_depth = Target
	}
	if Target.__callback != null
		Target.__callback()
}
