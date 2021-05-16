player_generator = new Scene(seqPlayerInit, SCREEN_W * 0.5, SCREEN_H * 0.5, "player")


key_anchor = NONE
key_pin_stop = false
key_pin_duration = -1
key_pin_period_short = 0.1
key_pin_period_long = 0.5
key_pinned = NONE


SCORE_DX = SCREEN_W * 0.5
SCORE_DY = SCREEN_W * 0.5

score_cycle = 0
SCORE_CYCLE_INCR = 26


function do_pause() {
	global.paused = true


	if player_generator.is_playing()
		player_generator.pause()


	instance_deactivate_all(true)
	instance_activate_object(oIgnore)

	return instance_create(oGamePause, "interface")
}


function do_resume() {
	global.paused = false


	instance_activate_all()


	if player_generator.is_paused()
		player_generator.play()
}

