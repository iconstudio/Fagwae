/// @description Initialize main menu

with oGlobal {
	with ui_create(ui_width * 0.5, ui_height * 0.5, oUIWindow, "ZUI") {
		ui_set_size(256, 320)

		with ui_create(0, 0, oUIWindowCaption, "ZUI_Above") {
			caption = "Popup"
		}
		
		with ui_create(ui_width * 0.5, ui_height - 32, oUIButton, "ZUI_Above") {
			ui_set_size(96, 32)
			caption = "OK"
			callback = ui_popup_close
		}
	}
}

menu_camera = camera_create_view(0, 0, 450, 800, 0, noone, 0, 0, -1, -1)
camera_apply(menu_camera)
event_user(0)

lx = screen_width * 0.5
ly = screen_height - 20
menuppdepth = 0
menupdepth = 0
menuldepth = 0
menudepth = 0

menu_clear(0)
menu_add(0, "START", "", 1)
menu_add(0, "HIGHSCORE", "", 1)
menu_add(0, "ACHIVEMENTS", "", 1)
menu_add(0, "SETTING", "", 1)
menu_add(0, "EXIT", "", 1)

background_color = 0

global.extreme = false
global.stage = 0

audio_stop_all()
global.music_before = noone
global.music_current = noone
music_update(musicMainMenu)
