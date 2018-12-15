/// @description Drawing application surface to screen

surface_set_target(surf)
gpu_set_blendenable(false)
gpu_set_blendmode_ext(bm_one, bm_zero)
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, $ffffff, 1)
gpu_set_blendmode(bm_normal)
gpu_set_blendenable(true)
surface_reset_target()
