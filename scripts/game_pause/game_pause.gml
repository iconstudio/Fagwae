/// @description game_pause()
/// @function game_pause
if instance_exists(oContinue) or instance_exists(oGameOver)
	exit

global.pause_counter++
