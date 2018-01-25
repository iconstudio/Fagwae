/// @description 

for (var i = 0; i <= maxdepth; ++i) {
	menupos[i] += (-13 * menusel[i] - menupos[i]) / 5
	menuscl[i] -= menuscl[i] / 5
	if menuinf[i, menusel[i]] != ""
		infoscl[i] += (1 - infoscl[i]) / 5
	else
		infoscl[i] -= infoscl[i] / 5

	if menuinf[i, menuold[i]] != ""
		infosco[i] -= infosco[i] / 5
}

if menudepth != menuldepth {
	menuppdepth = menupdepth
	menupdepth = menuldepth
	if menuppdepth = menudepth
		menuscr = 1 - menuscr
	else
		menuscr = 0;
	menuldepth = menudepth
}

if menuscr < 0.97
 menuscr += 0.03
else
 menuscr = 1
menurot = catmull_rom_spline(menuscr, menudepth, menupdepth, menudepth, menupdepth) * 90

if draw_mode > 0 {
	rfrm = 0
	if sgrv++ > 20 {
		switch draw_mode {
			case 1:
				//instance_create(0, 0, objHighScores)
				draw_mode = 4
				break
			case 5:
				//instance_create(0, 0, objAchivement)
				draw_mode = 4
				break
			case 6:
				//instance_create(0, 0, objProfileStatic)
				draw_mode = 4
				break
		}
	}

	if sgrv > 50 {
		if draw_mode == 2 {
			instance_destroy()
		} else if dmode == 3 {
			game_end()
		}
	}

	for (var i = 0; i < 3; ++i)
		rpush[i] += sgrv / 4
	exit
}

rfrm++
for (var i = 0; i < 3; ++i) {
	if rfrm > i * 10 + 12 && rpush[i] != 0 {
		rpush[i] -= rpush[i] / 4
		if (rpush[i] < 8) {
			if (rflash[i]++ > 15)
				rpush[i] = 0
		}
	}
}
