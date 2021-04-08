/// @description Update interfaces
Qui_update(global.qui_master, 0, 0)
global.qui_cursor = Qui_prefix(global.qui_master, 0, 0, 0)
global.qui_focused = (Qui_control(global.qui_master))

if !is_undefined(global.qui_focused) and global.qui_focused != global.qui_master {
	with global.qui_focused {
		if !is_undefined(control)
			control()
	}
}
