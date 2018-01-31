/// @description delete a character

if string_length(kstring) > 0 and dmode == 0 {
 kstring = string_copy(kstring, 1, string_length(kstring) - 1)
 key_press()
}
