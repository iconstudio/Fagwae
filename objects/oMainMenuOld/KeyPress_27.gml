/// @description Going menu back

if menu_outta()
	exit

if menusel[menudepth] != menucnt[menudepth] - 1 {
	menu_change_ready(menudepth)
	menusel[menudepth] = menucnt[menudepth] - 1
}
event_perform(ev_keypress, vk_enter)
