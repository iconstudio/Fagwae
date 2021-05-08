/// @description Initialization
triggers = new List()

trigger_index = 0
trigger_current = null


function trigger_clear() {
	trigger_index = 0

	if !triggers.is_empty() {
		triggers.foreach_all(function(Trig) {
			Trig.clear()
		})
	}
}


function trigger_add_element(element) {
	triggers.push_back(triggers)
}
