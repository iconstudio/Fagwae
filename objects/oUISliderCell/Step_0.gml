if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if pressed and mouse_prevx != mouse_x {
	x = clamp(mouse_x, ui_parent.x, ui_parent.x + ui_parent.ui_width)
	mouse_prevx = mouse_x
}