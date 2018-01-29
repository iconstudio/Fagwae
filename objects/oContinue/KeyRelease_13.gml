/// @description Continue

if draw_mode > 0
	exit

game_resume()
draw_mode = 1
frame = 0

if selected == 1 {
	instance_create_layer(0, 0, "Screen", oGameOver)
} else {
	with (oGameGlobal)
		event_user(0)
}

profile_save(global.profilefile)
