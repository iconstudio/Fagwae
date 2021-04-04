/// @description game_session_increase_kill()
/// @function game_session_increase_kill
function game_session_increase_kill() {
	with oGameGlobal {
		with session
			datas[? "kill"] = datas[? "kill"] + 1
	}


}
