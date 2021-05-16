player_generator = new Scene(seqPlayerInit, SCREEN_W * 0.5, SCREEN_H * 0.5, "player")


score_manager = instance_create(oGameScore, "scoreboard")


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

