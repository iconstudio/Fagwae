/// @description menu_add(mdepth, text, info, color, [localvar])
/// @function menu_add
/// @param mdepth { integer }
/// @param text { string }
/// @param info { string }
/// @param color { color }
/// @param [localvar] { string }

var mdepth = argument[0], localvar = ""
if argument_count > 4
	localvar = string(argument[4])

menucap[mdepth, menucnt[mdepth]] = argument[1]
menuinf[mdepth, menucnt[mdepth]] = argument[2]
menucol[mdepth, menucnt[mdepth]] = argument[3]
menuvar[mdepth, menucnt[mdepth]] = localvar
return menucnt[mdepth]++
