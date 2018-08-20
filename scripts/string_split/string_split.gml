/// @description string_split(str, index, [sep = ","]);
/// @function string_split
/// @param str { string }
/// @param index { integer }
/// @param [sep = ","] { string }

var str = argument[0]
if string_length(str) == 0
	return ""

var index = argument[1]
if index < 0
	return ""

var sep
if argument_count < 3
	sep = ","
else
	sep = argument[2]

var slength = string_length(sep) - 1
repeat index
	str = string_delete(str, 1, string_pos(sep, str) + slength)
str = string_delete(str, string_pos(sep, str), string_length(str))

return str
