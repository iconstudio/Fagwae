/// @description game_pause()
/// @function game_pause

global.screenlock = true
global.paused = true
instance_deactivate_all(true)
instance_activate_object(oIgnore)

screen_fade(0.5)
