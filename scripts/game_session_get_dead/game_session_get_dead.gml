/// @description game_session_get_dead()
/// @function game_session_get_dead
with oGameGlobal {
	with session
		return datas[? "dead"]
}
return 9999
