/// @description Move to room & fade out
room_goto(target_rm);
obj_player.x = target_x;
obj_player.y = target_y;

//fade out
image_speed = -1;