/// @description script_stage_clear()
/// @function script_stage_clear
function script_stage_clear() {
	global.stage++
	with oEnemyCollision
		instance_destroy()
	with oEnemyParent
		instance_destroy()



}
