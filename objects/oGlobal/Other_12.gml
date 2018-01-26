/// @description Queuing notification

ds_list_add(notification_list, construct)

if ds_list_size(notification_list) == 1 {
	event_user(3)
}
