/// @description Complete input

var len = string_length(kstring)
if len > 2 and len < 17 and dmode == 0 {
 global.status_name = kstring

 profile_save(global.profilefile)
 alarm[0] = -1
 dmode = 1
}
