/// @description Drawing main menu and name of the player

draw_set_valign(0)
draw_set_halign(0)

camera_projection_set(-230, 0, -230, 0, 0, 0, 0, -1, 0, 39, 1.332, 1, 32000)
draw_set_color($ffffff)

var aalpha
if menurot > 0
	aalpha = (90 - menurot) / 90
else
	aalpha = 1

// -38
draw_set_alpha(aalpha * (120 - rpush[0]) / 120 * get_ralpha(rflash[0]))
menu_text(rpush[0] + 22, -50, "FAGWAE", 6, menurot + 85)
draw_set_alpha(aalpha * (120 - rpush[1]) / 120 * get_ralpha(rflash[1]))
menu_text(8 + rpush[1], -4, "2018", 3, menurot + 85)
menu_text(20 + rpush[1], 13, "ICONSTUDIO", 3, menurot + 85)

aalpha = max((120 - rpush[2]) / 120 * get_ralpha(rflash[2]), 0)
if aalpha <= 0
	exit

var i, j, sw, ldy, dy, dalpha
for (j = 0; j <= maxdepth; ++j) {
	dy = menupos[j] - 22
	dalpha = 1 - abs(menurot / 90 - j)

	for (i = 0; i < menucnt[j]; ++i) {
		if i == menusel[j]
			draw_set_alpha(aalpha)
		else
			draw_set_alpha(dalpha * aalpha)

		if i == menusel[j]
			dscl = 4 - menuscl[j] * 2
		else if i == menuold[j]
			dscl = 2 + menuscl[j] * 2
		else
			dscl = 2

		draw_set_color(make_color_hsv(0, 0, 255 * menucol[j, i]))
		sw = menu_text(8 + rpush[2], dy - (dscl - 2) * 4.25, menucap[j, i], dscl, menurot - j * 90)
		ldy = dy
		dy += 5 * dscl + 3

		if menuinf[j, i] != "" {
			if i == menusel[j] {
				draw_set_alpha(aalpha * infoscl[j])
				menu_text(8 + rpush[2], dy - 0.875 * infoscl[j] + 0.25, "- " + menuinf[j, i], infoscl[j] * 1.75, menurot - j * 90)
				dy += 10.5 * infoscl[j]
			} else if i == menuold[j] {
				draw_set_alpha(aalpha * infosco[j])
				menu_text(8 + rpush[2], dy - 0.875 * infosco[j] + 0.25, "- " + menuinf[j, i], infosco[j] * 1.75, menurot - j * 90)
				dy += 10.5 * infosco[j]
			}
		}

		if menuvar[j, i] != "" {
			draw_set_alpha(dalpha * aalpha)
			draw_set_color(make_color_hsv(0, 0, 176 * menucol[j, i]))
			draw_transform_set_rotation_y(90)
			draw_transform_add_translation(-sw, 0, -sw)
			draw_transform_add_rotation_y(menurot - j * 90)
			draw_transform_add_translation(sw, 0, sw)
			draw_text_transformed(8 + (string_width(menucap[j, i]) + 3) * dscl + rpush[2], ldy - (dscl - 2) * 4, string(variable_global_get(menuvar[j, i])), dscl, dscl, 0)
			draw_transform_set_identity()
			draw_set_color(make_color_hsv(0, 0, 255 * menucol[j, i]))
		}
	}
}
draw_transform_set_identity()
camera_projection_identity()

draw_set_alpha(1)
draw_set_color($ffffff)
draw_set_halign(1)
draw_text_transformed(lx, ly + rpush[1], global.status_name, 1, 1, 0)
