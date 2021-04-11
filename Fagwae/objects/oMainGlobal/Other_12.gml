/// @description Go back
var cur = child_choice
if is_null(cur) or cur.transitioning
	exit

if is_null(cur.child_choice) {
	child_choice = null
	cur.do_close()
	menu_mode_change(MAIN_STATE_FADEIN)
} else {
	var subchild = null, picked = null
}
