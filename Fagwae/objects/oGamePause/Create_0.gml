/// @description Declare pause menus
bg_dimm = instance_exists(oGamePauseBackground) ? oGamePauseBackground.id : instance_create(oGamePauseBackground)
bg_dimm.do_capture()


title_x = SCREEN_W * 0.5
title_y = SCREEN_H * 0.3
item_x = SCREEN_W * 0.4 - 70
item_y = SCREEN_H * 0.3 + 90



function do_gotomain() {
	
}


function do_restart() {
	
}


menu = function(caption, predicate) constructor {
	this.caption = caption
	this.predicate = method(other, predicate)
}

menus = new List([
	new menu("Resume", method(oGameGlobal, do_resume)),
	new menu("Restart game", do_restart),
	new menu("Go to main menu", do_gotomain)
])

menu_selection = 0
menu_size = menus.get_size()


menu_drawer = method(self, function(i, item) {
	if menu_selection == i
		draw_set_color($ffffff)
	else
		draw_set_color($83104e)
	draw_text(item_x, item_y + i * 50, item.caption)
})