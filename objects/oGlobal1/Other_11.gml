/// @description notification dequeue

if instance_exists(callto) {
	var lpos = ds_list_find_index(notification_list, callto)
	if lpos != -1 {
		ds_list_delete(notification_list, lpos)
		callto = noone
	}
} else {
	exit
}

event_user(3)
