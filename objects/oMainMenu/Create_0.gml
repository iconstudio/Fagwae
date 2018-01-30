/// @description Initialize main menu

menu_camera = camera_create_view(0, 0, 450, 800, 0, noone, 0, 0, -1, -1)
camera_apply(menu_camera)
event_user(0)

lx = screen_width / 2
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
audio_play_sound(musicMainMenu, 0, true)
