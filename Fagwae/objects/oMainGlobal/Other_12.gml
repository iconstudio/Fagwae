/// @description Go back
var cur = child_choice
if is_null(cur) or cur.transitioning
	exit

if is_null(cur.child_choice) {
	menu_fadein()
	child_choice = null
	cur.do_close()
	menu_mode_change(main_state_fadein)
} else {
	var subchild = null, picked = null
}
