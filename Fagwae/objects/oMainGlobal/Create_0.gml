OPENING = 0
NORMAL = 10
GAME_START = 50
FADEIN = 79
FADEOUT = 80
QUIT = 99
mode = OPENING

fadeout_time = 0 
fadeout_period = 1.2
fadein_time = 0 
fadein_period = 1.4


main_menu = function(indicator, predicate) constructor {
	this.caption = caption
	this.indicater = is_null(indicator) ? null : method(other, indicator)
	this.predicate = is_null(predicate) ? null : method(other, predicate)
}


menus = new List([
	new main_menu(null, null)
])

menu_size = main_menu.get_size()


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE


draw_set_color($ffffff)
draw_set_font(fontMainMenuEntry)

audio_stop_all()
bgm = audio_play_sound(musicMainMenu, 100, true)

