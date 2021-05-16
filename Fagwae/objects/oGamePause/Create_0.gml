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


do_resume = method(oGameGlobal.id, oGameGlobal.do_resume)

menus = new List([
	new menu("Resume", do_resume),
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


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE
