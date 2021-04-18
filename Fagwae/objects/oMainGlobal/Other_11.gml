/// @description Execute a menu
var child = get_focus()
if !is_null(child_choice) or is_null(child) or child.transitioning
	exit

menu_fadeout()
if child != child_choice {
	child.do_open()
	child_choice = child
	menu_mode_change(main_state_fadeout)
}
