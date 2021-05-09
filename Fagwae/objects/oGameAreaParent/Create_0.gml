/// @description Initialization
triggers = new List()

trigger_index = 0
trigger_current = null



function trigger_start() {
	trigger_index = 0

	if !triggers.is_empty()
		trigger_current = triggers.at(0)
}



function trigger_clear() {
	if !triggers.is_empty() {
		triggers.foreach_all(function(Trig) {
			Trig.clear()
		})
	}
}


function trigger_add_element(element) {
	triggers.push_back(triggers)
}
