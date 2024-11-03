/// @description Checking player keys

// move keybinds
r_key = right_press();
l_key = left_press();
u_key = up_press();
d_key = down_press();

//interact keybinds
interact_key = command_pressed()
active_item_key = keyboard_check_pressed(vk_space);	
run_key = keyboard_check(vk_shift)

if run_key {
	//spr = spr_run
	// THIS FOR now so it doesn't break :)
	spr = spr_walk
	move_spd = 4
}
else {
	
	spr = spr_walk
	move_spd = 2
}
