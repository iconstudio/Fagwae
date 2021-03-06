/// @description Update game process
global.io_attack = global.key_attack.check()
global.io_crawl = global.key_crawl.check()

global.io_p_bomb = global.key_bomb.check_pressed()
global.io_p_pause = global.key_pause.check_pressed()


if global.gamepad_index != -1 and global.gamepad_shake != 0 {
	gamepad_set_vibration(global.gamepad_index, global.gamepad_shake, global.gamepad_shake)

	if 0 < global.gamepad_shake
		global.gamepad_shake -= GAMEPAD_FRICTION * Delta
	else
		global.gamepad_shake += GAMEPAD_FRICTION * Delta
}


if !global.paused {
	if !instance_exists(oGamePause) {
		if global.io_p_pause or os_is_paused() {
			do_pause()
		} elif global.io_p_restart {
			var Pauser = do_pause()
		}
	}
}

