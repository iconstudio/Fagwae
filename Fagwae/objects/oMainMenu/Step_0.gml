/// @description Update
do_update_logic()

global.key_confirm.foreach_all(function(Key) {
	if keyboard_check_pressed(Key)
		event_user(5)
})

global.key_back.foreach_all(function(Key) {
	if keyboard_check_pressed(Key)
		event_user(6)
})
