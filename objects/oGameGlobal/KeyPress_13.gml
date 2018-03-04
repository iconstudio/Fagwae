/// @description Resume

if !instance_exists(oContinue) and !instance_exists(oGameOver) {
	if global.screenlock {
		game_resume()
	}
}
