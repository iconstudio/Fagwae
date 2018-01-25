/// @description Clean memory up

font_delete(global.font)
font_delete(global.fontborder)

if surface_exists(surf)
	surface_free(surf)
