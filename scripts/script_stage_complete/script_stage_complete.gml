/// @description script_stage_complete(stage)
/// @function script_stage_complete
/// @param stage { integer }

//with oStageParent
//	instance_destroy()	would be automatically remove

instance_create_layer(0, 0, "Backend", global.area_list[argument0])
