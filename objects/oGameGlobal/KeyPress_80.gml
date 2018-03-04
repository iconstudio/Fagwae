/// @description Pause or Resume

if !instance_exists(oContinue) and !instance_exists(oGameOver) {
	if global.screenlock {
		game_resume()
	} else {
		game_pause()
	}
}
