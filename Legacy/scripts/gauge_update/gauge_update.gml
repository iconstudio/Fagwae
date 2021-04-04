/// @description gauge_update(id)
/// @function gauge_update
/// @param id { instance }
function gauge_update(argument0) {
	with find_hierachy(argument0) {
		with oGameGlobal {
			gauge_target = other.id
			gauge_time = min(gauge_period, other.hp_max)
			gauge_show_time = gauge_show_period
		}
		return id
	}



}
