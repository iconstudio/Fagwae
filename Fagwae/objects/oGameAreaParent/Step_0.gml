/// @description Update triggers
if !is_null(trigger_current) {
	var Ratio = trigger_current.update()

	if 1 <= Ratio {
		trigger_current = triggers.at(++trigger_index)
		//trigger_current = triggers.pop_front()

		trigger_current.execute()
	}
} elif !triggers.is_empty() {
	trigger_current = triggers.at(0)
}
