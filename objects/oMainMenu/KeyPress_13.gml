/// @description Executing menu

if menu_outta()
 exit

if menudepth == 0 {
	if menusel[0] == 0 { // start
		//var gg = instance_create_layer(0, 0, "UI", oGameGlobal)
		draw_mode = 2
		//gg.stage_content = oStageShape1
		/*
		menu_clear(1, 0)
		menu_add(1, "SHAPE AREA", "", 1)

		if global.log_openframe <= 0
			menu_add(1, "FRAME AREA", "COMPLETE SHAPE AREA", 0.5)
		else
			menu_add(1, "FRAME AREA", "", 1)

		if global.log_openframe <= 0
			menu_add(1, "INDETERMINATE AREA", "COMPLETE SHAPE AREA", 0.5)
		else if global.log_openindet <= 0
			menu_add(1, "INDETERMINATE AREA", "COMPLETE FRAME AREA", 0.5)
		else
			menu_add(1, "INDETERMINATE AREA", "", 1)

		menu_add(1, "BACK", "", 1)
		*/

	} else if menusel[0] == 1 { // highscore
		draw_mode = 1

	} else if menusel[0] == 2 { // achievements
		draw_mode = 5

	} else if menusel[0] == 3 { // setting
		menu_clear(1)
		menu_add(1, "MUSIC VOLUME", "", 1, "setting_music")
		menu_add(1, "SFX VOLUME", "", 1, "setting_sfx")
		menu_add(1, "EFFECTS", "", 1, "setting_effect")
		menu_add(1, "PROFILE", "", 1)
		menu_add(1, "BACK", "", 1)

	} else if menusel[0] == 4 { // exit
		menu_clear(1, 1)
		menu_add(1, "YES", "", 1)
		menu_add(1, "NO", "", 1)
	}

	if menusel[0] != 2
		menudepth = 1

} else if menudepth == 1 {
	if menusel[1] == menucnt[1] - 1 { // when choose back
		menudepth = 0
	} else if menusel[0] == 0 { // start
		// add 3 stages for each area
		var cond_shape = (menusel[1] == 0 && global.log_openshape > 0)
		var cond_frame = (menusel[1] == 1 && global.log_openframe > 0)
		var cond_indeterminate = (menusel[1] == 2 && global.log_openindet > 0)

		if cond_shape or cond_frame or cond_indeterminate {
			menu_clear(2)
			menu_add(2, "STAGE 1", "", 1)
			for (var i = 1; i < 3; ++i) {
				if (menusel[1] == 0 && global.log_openshape > i) or
				(menusel[1] == 1 && global.log_openframe > i) or
				(menusel[1] == 2 && global.log_openindet > i)
					menu_add(2, "STAGE " + string(i + 1), "", 1)
				else
					menu_add(2, "STAGE " + string(i + 1), "CLEAR STAGE " + string(i), 0.5)
			}
			menu_add(2, "BACK", "", 1)
			menudepth = 2
		}

	} else if menusel[0] == 3 { // setting
		menudepth = 2
		if menusel[1] == 0 { // music volume
			menu_clear(2, global.setting_music)
		} else if menusel[1] == 1 { // sfx volume
			menu_clear(2, global.setting_sfx)
		} else if menusel[1] == 2 { // effect
			menu_clear(2, !global.setting_effect)
			menu_add(2, "ON", "", 1)
			menu_add(2, "OFF", "", 1)
		} else if menusel[1] == 3 { // profile
			menu_clear(2, 0)
			menu_add(2, "DELETE", "", 1)
		}

		if menusel[1] == 0 or menusel[1] == 1 { // when choose a volume option
			for (var i = 0; i <= 10; ++i)
				menu_add(2, string(i), "", 1)
		}
		menu_add(2, "BACK", "", 1) // for all

	} else if menusel[0] == 4 { // exit game
		draw_mode = 3
	}

} else if menudepth == 2 { // deep
	if menusel[2] == menucnt[2] - 1 { // when choose back
		menudepth = 1
	} else {
		if menusel[0] = 0 { // start a game
			var cond_shape = (menusel[1] == 0 && global.log_openshape > menusel[2])
			var cond_frame = (menusel[1] == 1 && global.log_openframe > menusel[2])
			var cond_indeterminate = (menusel[1] == 2 && global.log_openindet > menusel[2])

			var stage_creating = ""
			if cond_shape
				stage_creating = "oStageShape"
			else if cond_frame
				stage_creating = "oStageFrame"
			else if cond_indeterminate
				stage_creating = "oStageIndeterminate"

			if cond_shape or cond_frame or cond_indeterminate {
				var gg = instance_create_layer(0, 0, "UI", oGameGlobal)
				global.stage = menusel[2] + 1
				draw_mode = 2

				var stage_required = asset_get_index(stage_creating + string(menusel[2] + 1))
				if stage_required <= 0
					show_error("Error when creating a area:\nfrom area_creating to " + string(stage_required), true)
				gg.stage_content = stage_required
				//instance_create_layer(0, 0, "Backend_1", area_required)
			}
				
		} else if menusel[0] == 3 { // setting
			if menusel[1] == 0 { // music volume
				global.setting_music = menusel[2]
				menudepth = 1
				profile_save(global.profilefile)
			} else if menusel[1] == 1 { // sfx volume
				global.setting_sfx = menusel[2]
				menudepth = 1
				profile_save(global.profilefile)
			} else if menusel[1] == 2 { // effect
				global.setting_effect = !menusel[2]
				menudepth = 1
				profile_save(global.profilefile)
			} else if menusel[1] == 3 {
				if menusel[2] == 0 { // deleting profile
					menu_clear(3, 1)
					menu_add(3, "OK", "", 1)
					menu_add(3, "CANCEL", "", 1)
					menudepth = 3
				}
			}
		}
	}
} else if menudepth == 3 {
	if menusel[3] == 0 { // deleting profile
		draw_mode = 6
	} else {
		menudepth = 2
	}
}

alarm[0] = -1
autostop = false
