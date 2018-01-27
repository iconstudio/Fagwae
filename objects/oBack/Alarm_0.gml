/// @description 

var inst

if (dcnt1-- > -4) {
 inst = instance_create_layer(225 + lengthdir_x(204, rots + dcnt1 * 42), 500 + dcnt1 * 144 + scroll, "Backend_2", oBackFlash)
 inst.vspeed = 0.75
 inst.image_angle = lengthdir_y(56, rots + dcnt1 * 42)
 alarm[0] = 4
}

if (dcnt2-- > -7 && dcnt1 < 0) {
 inst = instance_create_layer(225 + lengthdir_x(102, rots + dcnt2 * 42 + 90), 400 + dcnt2 * 72 + scroll / 2, "Backend_2", oBackFlash)
 inst.depth -= 10
 inst.vspeed = 0.375
 inst.image_xscale = 0.5
 inst.image_yscale = 0.5
 inst.image_angle = lengthdir_y(56, rots + dcnt2 * 42 + 90)
 alarm[0] = 4
}
