/// @description Executing menu

if menu_outta()
 exit

if menudepth == 0 {
 lastsel0 = menusel[0]
 if menusel[0] == 0 {
  menu_clear(1, 0)
  menu_add(1, "NORMAL MODE", "", 1)
  //if global.p_openextreme == 0
   menu_add(1, "EXTREME MODE", "COMPLETE NORMAL MODE", 0.5)
  //else
  // menu_add(1, "EXTREME MODE", "", 1)
  menu_add(1, "BACK", "", 1)
 } else if menusel[0] == 1 {
  menu_clear(1)
  if global.network {
   menu_add(1, "NORMAL", "", 1, "p_high1")
   menu_add(1, "EXTREME", "", 1, "p_high2")
  } else {
   menu_add(1, "NORMAL", "NETWORK REQUIRED", 0.5, "p_high1")
   menu_add(1, "EXTREME", "NETWORK REQUIRED", 0.5, "p_high2")  
  }
  menu_add(1, "BACK", "", 1)
 } else if menusel[0] == 2 {
  draw_mode = 5
 } else if menusel[0] == 3 {
  menu_clear(1)
  menu_add(1, "EFFECT VOLUME", "", 1, "p_evolt")
  menu_add(1, "MUSIC VOLUME", "", 1, "p_mvolt")
  menu_add(1, "WAVE EFFECT", "RECOMMENDED", 1, "p_exteffects")
  menu_add(1, "RESOLUTION", "", 1)
  menu_add(1, "PROFILE", "", 1)
  menu_add(1, "BACK", "", 1)
 } else if menusel[0] == 4 {
  menu_clear(1, 1)
  menu_add(1, "YES", "", 1)
  menu_add(1, "NO", "", 1)
 }
 if menusel[0] != 2
  menudepth = 1
} else if menudepth = 1 {
 if menusel[1] = menucnt[1] - 1 {
  menudepth = 0
 } else if menusel[0] == 0 {
  setmode = 0
  if menusel[1] == 0
   setmode = 1
  else if menusel[1] == 1 && global.p_openextreme != 0
   setmode = 2
  else if menusel[1] == 2
   setmode = 3
  else
   exit
  if setmode < 3 {
   menu_clear(2)
   menu_add(2, "AREA 1", "", 1)
   for (var i = 1; i < 4; ++i) {
    if setmode == 1 && (min(4, global.p_opennormal) > i or (setmode == 2 && min(4, global.p_openextreme) > i))
     menu_add(2, "AREA " + string(i + 1), "", 1)
    else
     menu_add(2, "AREA " + string(i + 1), "CLEAR AREA " + string(i), 0.5)
   }
   menu_add(2, "BACK", "", 1)
   menudepth = 2
  }
 } else if menusel[0] == 1 {
  if global.network {
   draw_mode = 1
   if menusel[1] != 2
    global.extreme = menusel[1]
  }
 } else if menusel[0] == 3 {
  menudepth = 2
  if menusel[1] == 0 {
   menu_clear(2, global.p_effectvol)
  } else if menusel[1] == 1 {
   menu_clear(2, global.p_musicvol)
  } else if menusel[1] == 2 {
   menu_clear(2, !global.p_exteffect)
   menu_add(2, "ON", "", 1)
   menu_add(2, "OFF", "", 1)
  } else if menusel[1] == 3 {
   menu_clear(2, global.p_scrmode)
   menu_add(2, "640 X 480", "RECOMMENDED", 1)
   menu_add(2, "800 X 600", "", 1)
   menu_add(2, "FULL SCREEN", "", 1)
  } else if menusel[1] == 4 {
   menu_clear(2, 0)
   menu_add(2, "STATIC", "", 1)
   menu_add(2, "DELETE", "", 1)
  }
  if menusel[1] == 0 or menusel[1] == 1 {
   for (var i = 0; i <= 10; ++i)
    menu_add(2, string(i), "", 1)
  }
  menu_add(2, "BACK", "", 1)
 } else if menusel[0] == 4 {
  draw_mode = 3
 }
} else if menudepth == 2 {
 if menusel[2] == menucnt[2] - 1 {
  menudepth = 1
 } else {
  if menusel[0] = 0 {
   if (menusel[1] == 0 && min(4, global.p_opennormal) > menusel[2]) or (menusel[1] == 1 && min(4, global.p_openextreme) > menusel[2]) {
    if menusel[1] == 1 {
     global.diff = 5
     global.disf = global.diff
     global.extreme = 1
    } else {
     global.diff = 1
     global.disf = global.diff
     global.extreme = 0
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
    //d3d_end()
   }
  } else if menusel[0] == 3 {
   if menusel[1] == 0 {
    //global.p_effectvol = menusel[2]
    //sound_setting()
    menudepth = 1
    //profile_save(global.profilefile)
   } else if menusel[1] == 1 {
    //global.p_musicvol = menusel[2]
    //sound_setting()
    menudepth = 1
    //profile_save(global.profilefile)
   } else if menusel[1] == 2 {
    //global.p_exteffect = !menusel[2]
    //wave_setting()
    menudepth = 1
    //profile_save(global.profilefile)
   } else if menusel[1] == 3 {
    //global.p_scrmode = menusel[2]
    //screen_setting()
    menudepth = 1
   } else if menusel[1] == 4 {
    if menusel[2] == 0 {
     draw_mode = 6
    } else if menusel[2] == 1 {
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
  //instance_create_layer(0, 0, "UI", oProfileReset)
  draw_mode = 2
 } else {
  menudepth = 2
 }
}

alarm[0] = -1
autostop = false
