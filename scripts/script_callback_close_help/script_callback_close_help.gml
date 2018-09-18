with ui_parent { // oUIWindow
	with callback_parent { // oUIHelpButton
		dmode = 0
		pane_instance = noone
	}

	with black // oUIBlack
		instance_destroy()

	instance_destroy()
}
instance_destroy() // oUIButton

with oUIButtonPane {
	if content_number > 0 {
		for (var i = 0; i < content_number; ++i)
			instance_destroy(contents[i])
		}
}
