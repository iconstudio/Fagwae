/// @description zui_main()

if instance_exists(oZUIMain)
	return oZUIMain.id
else
	return instance_create_layer(0, 0, "Screen", oZUIMain)
