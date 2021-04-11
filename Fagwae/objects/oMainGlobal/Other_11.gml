/// @description Execute a menu
var child = child_focus
if is_null(child) or child.transitioning
	exit

child.do_open()
menu_mode_change(MAIN_STATE_FADEOUT)
