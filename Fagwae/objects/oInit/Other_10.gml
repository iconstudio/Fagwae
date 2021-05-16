/// @description Declare keys
global.key_left = new GeneralInputAnchor([vk_left, ord("H")], [gp_padl])
global.key_right = new GeneralInputAnchor([vk_right, ord("L")], [gp_padr])
global.key_up = new GeneralInputAnchor([vk_up, ord("J")], [gp_padu])
global.key_down = new GeneralInputAnchor([vk_down, ord("K")], [gp_padd])


global.key_confirm = new GeneralInputAnchor([ord("X"), vk_enter, vk_space], [gp_face1, gp_shoulderr, gp_stickr])
global.key_back = new GeneralInputAnchor([ord("C"), vk_backspace], [gp_face2, gp_shoulderl, gp_stickl])


global.key_attack = new GeneralInputAnchor([ord("Z"), ord("A"), vk_space], [gp_face1, gp_shoulderrb])
global.key_bomb = new GeneralInputAnchor([ord("X"), ord("S"), vk_control], [gp_face3])
global.key_crawl = new GeneralInputAnchor([ord("C"), ord("D"), vk_shift], [gp_shoulderl, gp_shoulderr])
global.key_pause = new GeneralInputAnchor([ord("P"), vk_escape, vk_backspace], [gp_start])
global.key_restart = new GeneralInputAnchor([ord("R")], [gp_select])
global.key_crawl_toggle = new GeneralInputAnchor([ord("V"), ord("F"), vk_alt], [gp_face4])


global.joy_left_h = new JoystickAnchor(gp_axislh)
global.joy_left_v = new JoystickAnchor(gp_axislv)
global.joy_right_h = new JoystickAnchor(gp_axisrh)
global.joy_right_v = new JoystickAnchor(gp_axisrv)


global.io_mouse_left = false
global.io_mouse_p_left = false
global.io_mouse_r_left = false


global.io_left = false
global.io_right = false
global.io_up = false
global.io_down = false
global.io_attack = false
global.io_crawl = false


global.io_p_left = false
global.io_p_right = false
global.io_p_up = false
global.io_p_down = false
global.io_p_confirm = false
global.io_p_back = false
global.io_p_bomb = false
global.io_p_pause = false
global.io_p_restart = false
global.io_p_crawl_toggle = false


global.io_r_left = false
global.io_r_right = false
global.io_r_up = false
global.io_r_down = false
