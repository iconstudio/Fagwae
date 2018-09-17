/// @function profile_read_status(data)
/// @description 프로필 중 플레이어 상태를 읽어옵니다.
/// @param data { buffer }

global.status_name = buffer_read(argument0, buffer_string)
global.status_id = buffer_read(argument0, buffer_string)
global.status_tutorial = buffer_read(argument0, buffer_bool)
global.status_goneextreme = buffer_read(argument0, buffer_bool)
global.status_doneextreme = buffer_read(argument0, buffer_bool)

return true
