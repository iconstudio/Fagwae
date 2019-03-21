/// @description gauge_update(id)
/// @function gauge_update
/// @param id { instance }
with argument0 {
	if !instance_exists(parent) {
		with oGameGlobal {
			gauge_target = other.id
			gauge_time = min(gauge_period, other.hp_max)
			gauge_show_time = gauge_show_period
		}
		return id
	} else {
		gauge_update(parent)
	}
}
