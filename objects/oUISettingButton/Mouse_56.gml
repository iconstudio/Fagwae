/// @description Creating a setting panel

if pressed and dmode == 0 {
	pressed = false

	if instance_exists(oMainMenu) and (oMainMenu.draw_mode != 0 or oMainMenu.intro)
		exit

	if true /*global.ui_top == id*/ {
		//if !global.screenlock
		//	game_pause()
		with oGlobal {
			other.pane_instance = ui_create(0, 0, oUIWindow, "ZUI")
			other.pane_instance.callback_parent = other.id
			var _black = ui_create(0, 0, oUIBlack, "ZUI_Below")

			with other.pane_instance {
				ui_set_size(420, 800)
				event_user(0)
				ui_take_center()
				black = _black

				with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") { // +32
					caption = "설정"
				}

				with ui_create(0, 0, oUILabel, "ZUI_Above") { // +30
					ui_take_center()
					ui_label_set_caption("효과음 음량")
					y = ui_parent.y + 72
				}
				with ui_create(0, 0, oUISlider, "ZUI_Above") { // +30
					ui_set_size(300, 16)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + 102
					ui_slider_init(0, 10, global.setting_sfx, script_callback_volume_sfx)
				}

				with ui_create(0, 0, oUILabel, "ZUI_Above") { // +40
					ui_take_center()
					ui_label_set_caption("음악 음량")
					y = ui_parent.y + 142
				}
				with ui_create(0, 0, oUISlider, "ZUI_Above") { // +30
					ui_set_size(300, 8)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + 172
					ui_slider_init(0, 10, global.setting_music, script_callback_volume_music)
				}

				with ui_create(40, 246, oUICheckbox, "ZUI_Above") { // +64
					caption = "폭발 효과 사용"
					value = global.setting_effect
					callback = script_callback_effect
				}

				with ui_create(40, 278, oUICheckbox, "ZUI_Above") { // +32
					caption = "FXAA 사용"
					value = global.setting_fxaa
					callback = script_callback_fxaa
				}

				with ui_create(0, 0, oUIButton, "ZUI_Above") {
					ui_set_size(96, 32)
					event_user(0)
					ui_take_center()
					y = ui_parent.y + ui_get_height(ui_parent) - 40
					caption = "확인"
					callback = script_callback_close_setting
				}
			}
		} // #with oGlobal
		dmode = 1
	}
}
