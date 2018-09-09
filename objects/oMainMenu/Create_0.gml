/// @description Setting up main menu

menu_selected = 0
if global.flag_is_pc {
	menu_count = 4
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT", "EXIT"]
} else {
	menu_count = 3
	menu_content = ["START", "STATISTICS", "ACHIEVEMENT"]
}

dmode = 0

