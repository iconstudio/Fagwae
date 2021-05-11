x = SCREEN_W + 500
y = SCREEN_H * 0.2


cp_project_enter_x = SCREEN_W * 0.5
cp_project_enter_y = SCREEN_H * 0.5
cp_project_enter_time = 0
cp_project_enter_period = 0.6
cp_project_enter_paa_time = 0
cp_project_enter_paa_period = 0.7
image_angle = point_direction(x, y, cp_project_enter_x, cp_project_enter_y)


cp_project_rotate_time = 0
cp_project_rotate_period = 0.94
cp_project_fold_time = 0
cp_project_fold_period = 3.14


blur_surface = surface_create(SCREEN_W, SCREEN_H)

/*
lyr_interface = layer_get_id("interface")
sq_element = layer_sequence_create(lyr_interface, 320, 480, seqIntro)
layer_sequence_play(sq_element)

flow = false
