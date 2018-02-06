/// @description Getting damage

if other.pow <= 0 or dead
	exit

hurt = other.pow
event_user(15)

with other
	event_user(0)
