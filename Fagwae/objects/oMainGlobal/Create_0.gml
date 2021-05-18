FagwaeMainMenu = instance_create(oMainMenu, "interface")


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

