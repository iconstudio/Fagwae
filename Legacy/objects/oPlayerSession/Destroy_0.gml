global.log_kills += datas[? "kill"]
global.log_deads += datas[? "dead"]

profile_save(global.profilefile)
ds_map_destroy(datas)
