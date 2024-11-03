if (instance_number(object_index) > 1) instance_destroy();

var pos_x = camera_get_view_x(view_camera[0]) + 0.33*camera_get_view_width(view_camera[0])
var pos_y = camera_get_view_y(view_camera[0]) + 0.1*camera_get_view_height(view_camera[0])

	
display_windows(pos_x, pos_y)
display_cursor(pos_x, pos_y)
	
display_tab(pos_x, pos_y)