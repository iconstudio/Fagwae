Menu()

next = null
before = null

transitioning = false
focus_time = 0
focus_period = 1
unfocus_time = 0
unfocus_period = 1

__callback_open = null
__callback_close = null


///@function do_open()
do_open = function() {
	if !is_null(__callback_open) and not transitioning
		menu_mode_change(__callback_open)
}


///@function do_close()
do_close = function() {
	if !is_null(__callback_close) and not transitioning
		menu_mode_change(__callback_close)
}


sub_state_normal = new menu_state() // do nothing
sub_state_normal.caption = "main-sub-general-normal"
sub_state_normal.set_initializer(function() {
	transitioning = false
})


sub_state_fadeout = new menu_state()
sub_state_fadeout.caption = "main-sub-general-fadeout"
sub_state_fadeout.set_next(null)


sub_state_fadein = new menu_state()
sub_state_fadein.caption = "main-sub-general-fadein"
sub_state_fadein.set_next(sub_state_normal)


event_user(0)
