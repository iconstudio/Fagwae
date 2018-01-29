/// @description game_pause()
/// @function game_pause

global.screenlock = true
instance_deactivate_all(true)
instance_activate_object(oIgnore)
instance_deactivate_object(oGameGlobal)
