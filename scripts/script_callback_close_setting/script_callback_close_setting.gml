with ui_parent { // oUIWindow
	with callback_parent { // oUISettingButton
		dmode = 0
		pane_instance = noone
	}

	with black // oUIBlack
		instance_destroy()

	instance_destroy()
}
instance_destroy() // oUIButton
game_resume()

if instance_exists(oMainMenu)
	oMainMenu.frame = 0
