/// @description menu_clear(index, [selection])
/// @function menu_clear
/// @param index { integer }
/// @param [selection] { integer }

var menu_index = argument[0]
if menu_index > maxdepth
	maxdepth = menu_index

var defsel = 0
if argument_count > 1
	defsel = argument[1]

menucnt[menu_index] = 0
menusel[menu_index] = defsel
menuold[menu_index] = defsel
menuscl[menu_index] = 0
menupos[menu_index] = -15 * defsel
infoscl[menu_index] = 0
infosco[menu_index] = 0
