/// @description Go back
var cur = child_choice

if is_null(cur) or cur.transitioning
	exit

var subchild = null, picked = null
if is_null(cur.child_choice) {
	cur.do_close()
	menu_mode_change(MAIN_STATE_FADEIN)
} else {
	
}
