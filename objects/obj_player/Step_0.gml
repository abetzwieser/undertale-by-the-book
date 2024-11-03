/// @description Player actions

//idling
if (hspeed == 0 && vspeed == 0) {
	image_speed = 0;
}

if inventory_pressed() {
	if !global.inventory_displayed {
		global.inventory.display_inventory();
	}
	else {
		global.inventory.undisplay_inventory();
	}
}

//if quit_pressed() {
//	if global.inventory_displayed{
//		global.inventory.undisplay_inventory();
//	}
//}

if global.inventory_displayed || global.dialogue_in_progress {
	can_move = false;
	hspeed = 0
	vspeed = 0
}
else {
	can_move = true;
}

//animating player
if (can_move){
	hspeed = (r_key - l_key) * move_spd;
	vspeed = (d_key - u_key) * move_spd;
	
	// collisions
	if place_meeting(x+hspeed, y, obj_collision){
		image_speed = 0;
		hspeed = 0;
	}
	else if place_meeting(x, y+vspeed, obj_collision){
		image_speed = 0;
		vspeed = 0;
	}
	
	if (r_key || u_key || l_key || d_key) {
		vector = round(point_direction(0,0, r_key - l_key, d_key - u_key));
		player_dir = player_dirs[(vector / 90)];
		sprite_index = spr[player_dir];
		image_speed = 1;
	}
}

// checking for collision
if interact_key && !global.inventory_displayed && !global.dialogue_in_progress {
	if player_dir == PLAYER_DIR.RIGHT {
		adjust_x = 10;
		adjust_y = -5;
	}
	else if player_dir == PLAYER_DIR.LEFT {
		adjust_x = -40;
		adjust_y = -5;
	}
	else if player_dir == PLAYER_DIR.DOWN {
		adjust_x = -20;
		adjust_y = 20;
	}
	else if player_dir == PLAYER_DIR.UP{
		adjust_x = -20;
		adjust_y = -40;
	}
	
	var pos_x = x+adjust_x;
	var pos_y = y+adjust_y;
	
	if (collision(pos_x, pos_y)){
		var obj = instance_place(pos_x, pos_y, obj_obj);
		if (obj != noone) {
			obj.interact();
		}
	}
	else if (active_item_key){
		global.active_item.use();
		// anim sets activate here depending on active_item
	}
}

