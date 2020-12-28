/// @description game_session_increase_dead()
/// @function game_session_increase_dead
function game_session_increase_dead() {
	with oGameGlobal {
		with session
			datas[? "dead"] = datas[? "dead"] + 1
	}


}
