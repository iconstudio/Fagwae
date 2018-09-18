if !instance_exists(ui_parent) {
	instance_destroy()
	exit
}

if pressed {
	pressed = false

	if global.ui_top == id {
		if !selected {
			selected = true
			ui_parent.callback_parent.button_focus = id
			if callback >= 0
				script_execute(callback, id)
		}
	} 
} else if selected and global.ui_top != id and instance_exists(global.ui_top) and object_get_name(global.ui_top.object_index) == "oUIButtonPane" {
	selected = false
	ui_hover = false
	event_user(1)
}
