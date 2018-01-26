/// @description Executing menu

if menu_outta()
 exit

if menudepth == 0 {
	if menusel[0] == 0 { // start
		menu_clear(1, 0)
		menu_add(1, "NORMAL MODE", "", 1)
		if !global.log_openextreme
			menu_add(1, "EXTREME MODE", "COMPLETE NORMAL MODE", 0.5)
		else
			menu_add(1, "EXTREME MODE", "", 1)
		menu_add(1, "BACK", "", 1)

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
		var setmode = 3
		if menusel[1] == 0 // normal
			setmode = 1
		else if menusel[1] == 1 && global.log_openextreme > 0 // extreme
			setmode = 2

		if setmode < 3 {
			menu_clear(2)
			menu_add(2, "AREA 1", "", 1)
			for (var i = 1; i < 4; ++i) {
				if (setmode == 1 && global.log_opennormal > i) or (setmode == 2 && global.p_openextreme > i)
					menu_add(2, "AREA " + string(i + 1), "", 1)
				else
					menu_add(2, "AREA " + string(i + 1), "CLEAR AREA " + string(i), 0.5)
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
			var cond_normal = (menusel[1] == 0 && global.log_opennormal > menusel[2])
			var cond_extreme = (menusel[1] == 1 && global.log_openextreme > menusel[2])
			if (cond_normal or cond_extreme) {
				if menusel[1] == 1 { // extreme
					global.diff = 5
					global.extreme = true
				} else { // normal
					global.diff = 1
					global.extreme = false
				}

				instance_create_layer(0, 0, "UI", oGameGlobal)
				instance_create_layer(0, 0, "UI", oAchiveString)
				if menusel[2] == 0
					instance_create_layer(0, 0, "Backend_1", oArea1)
				else if menusel[2] == 1
					instance_create_layer(0, 0, "Backend_1", oArea2)
				else if menusel[2] == 2
					instance_create_layer(0, 0, "Backend_1", oArea3)
				else if menusel[2] == 3
					instance_create_layer(0, 0, "Backend_1", oArea4)
				draw_mode = 2
			}
		} else if menusel[0] == 3 { // setting
			if menusel[1] == 0 { // music volume
				global.setting_music = menusel[2]
				menudepth = 1
			} else if menusel[1] == 1 { // sfx volume
				global.setting_sfx = menusel[2]
				menudepth = 1
			} else if menusel[1] == 2 { // effect
				global.setting_effect = !menusel[2]
				menudepth = 1
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
	if menusel[3] == 0 {
		//instance_create_layer(0, 0, "Backend_1", oProfileReset)
		draw_mode = 2
	} else {
		menudepth = 2
	}
}

alarm[0] = -1
autostop = false
