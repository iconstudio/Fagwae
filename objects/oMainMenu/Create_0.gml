/// @description Initialize main menu

draw_mode = 0
sgrv = 0
rfrm = 0
for (var i = 0; i < 3; ++i) {
 rpush[i] = 120
 rflash[i] = 0
}

lx = global.screen_gui_cx
ly = global.screen_gui_cy * 2 - 20
maxdepth = 0
menuppdepth = 0
menupdepth = 0
menuldepth = 0
menudepth = 0
menurot = 0
menuscr = 1

menu_clear(0)
menu_add(0, "START", "", 1)
menu_add(0, "HIGHSCORE", "", 1)
menu_add(0, "ACHIVEMENT", "", 1)
menu_add(0, "SETTING", "", 1)
menu_add(0, "EXIT", "", 1)

lastkey = -1
autostop = false

background_color = 0

event_user(1)

global.extreme = false
