/// @description Continue
if 0 < mode or popup_time[1] < popup_period[1]
	exit

game_resume()
mode = 1

if selected == 1 {
	instance_create_layer(0, 0, "Screen", oGameOver)
} else {
	with oGameGlobal
		event_user(0)
}
profile_save(global.profilefile)
