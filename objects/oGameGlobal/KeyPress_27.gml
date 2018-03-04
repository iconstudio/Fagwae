/// @description Pause or Goto main menu

if !instance_exists(oContinue) and !instance_exists(oGameOver) {
	if global.screenlock {
		game_resume()
		room_goto(roomMain)
	} else {
		game_pause()
	}
}
