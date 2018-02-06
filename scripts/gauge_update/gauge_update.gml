/// @description gauge_update(id)
/// @function gauge_update
/// @param id { instance }

with (argument0) {
	if !instance_exists(parent) {
		global.gauge_count = hp_max
		global.gauge_target = id

		global.gauge_caption = name
		global.gauge_hp = hp
		global.gauge_hp_max = hp_max
	} else {
		gauge_update(parent)
	}
}

global.gauge_alpha = 1
