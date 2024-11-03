/// @description Teleport player
if place_meeting(x, y, obj_player) {
	var _instantiated = instance_create_depth(0,0,-999, obj_dark_transition);
	_instantiated.target_x = target_x;
	_instantiated.target_y = target_y;
	_instantiated.target_rm = target_rm;
}