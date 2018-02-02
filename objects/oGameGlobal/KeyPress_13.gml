/// @description Resume

if !instance_exists(oContinue) and !instance_exists(oGameOver) {
	if global.paused or global.screenlock {
		game_resume()
	}
}
