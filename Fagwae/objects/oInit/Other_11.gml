/// @description Declare keys
global.key_left = new fag_input([vk_left, ord("H")])
global.key_right = new fag_input([vk_right, ord("L")])
global.key_up = new fag_input([vk_up, ord("J")])
global.key_down = new fag_input([vk_down, ord("K")])


global.key_confirm = new fag_input([ord("X"), vk_enter, vk_space])
global.key_back = new fag_input([ord("C"), vk_backspace])


global.key_attack = new fag_input([ord("Z"), ord("A"), vk_space])
global.key_bomb = new fag_input([ord("X"), ord("S"), vk_control])
global.key_crawl = new fag_input([ord("C"), ord("D"), vk_shift])
global.key_pause = new fag_input([ord("P"), vk_escape, vk_backspace])


global.io_mouse_left = false
global.io_mouse_p_left = false
global.io_mouse_r_left = false


global.io_left = false
global.io_right = false
global.io_up = false
global.io_down = false
global.io_confirm = false
global.io_back = false
global.io_attack = false
global.io_crawl = false


global.io_p_left = false
global.io_p_right = false
global.io_p_up = false
global.io_p_down = false
global.io_p_confirm = false
global.io_p_back = false
global.io_p_attack = false
global.io_p_bomb = false
global.io_p_pause = false


global.io_r_left = false
global.io_r_right = false
global.io_r_up = false
global.io_r_down = false
global.io_r_attack = false
