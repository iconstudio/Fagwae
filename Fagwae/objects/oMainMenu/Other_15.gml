/// @description Execute a menu
with global.main_depth {
	var Focus = get_focus()
	if Focus != null {
		global.main_depth_previous = global.main_depth
		global.main_depth = select(Focus)
	}
}
