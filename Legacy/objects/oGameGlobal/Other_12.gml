/// @description Check achievement
var abefore, aresult
for (var i = 0; i < global.achievement_count; ++i) {
	abefore = global.achievement_cleared[i]
	aresult = script_execute(global.achievement_updater[i])
	
	if aresult and !abefore { // a new achieved trophy
		if global.flag_is_mobile {
			
		} else {
			notification_add(-1, "Achievement Cleared!", global.achievement_caption[i])
		}
		global.achievement_cleared[i] = true
	}
}
