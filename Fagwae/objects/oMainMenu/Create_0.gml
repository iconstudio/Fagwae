Menu()

sub_state_normal = new menu_state() // do nothing
sub_state_normal.caption = "main-sub-general-normal"
sub_state_normal.set_initializer(function() {
	transitioning = false
})


sub_state_fadeout = new menu_state()
sub_state_fadeout.caption = "main-sub-general-fadeout"
sub_state_fadeout.set_next(sub_state_normal)


sub_state_fadein = new menu_state()
sub_state_fadein.caption = "main-sub-general-fadeout"
sub_state_fadein.set_next(sub_state_normal)


event_user(0)
