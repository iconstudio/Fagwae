if cp_project_enter_time < cp_project_enter_paa_period {
	cp_project_enter_time += Delta
} elif cp_project_enter_paa_time < cp_project_enter_paa_period {
	cp_project_enter_paa_time += Delta
} elif cp_project_fold_time < cp_project_fold_period {
	if cp_project_rotate_time < cp_project_rotate_period {
		cp_project_rotate_time += Delta
	} else {
		cp_project_rotate_time -= Delta
	}


	cp_project_fold_time += Delta
} else {
	
}


/*
if layer_sequence_is_finished(sq_element) and !flow {
	flow = true
	alarm[0] = 1
}
