/// @description Update game process
global.io_crawl = global.key_crawl.check()

global.io_p_attack = global.key_attack.check_pressed()
global.io_p_bomb = global.key_bomb.check_pressed()
global.io_p_pause = global.key_pause.check_pressed()


if global.paused {
	if global.io_p_pause {
		undo_pause()
	}
} else {
	if os_is_paused() {
		do_pause()
	} elif global.io_p_pause {
		do_pause()
	}
}
