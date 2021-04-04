/// @description Load audios
if ds_map_exists(async_load, "type") {
	var type = ds_map_find_value(async_load, "type")
	if type == "audiogroup_load" {
		var group_id = ds_map_find_value(async_load, "group_id")

		if group_id == audiogroup_game {
			audio_loaded = true
			alarm[0] = 1
		}
	}
}
