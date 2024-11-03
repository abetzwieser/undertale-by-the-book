/// @description Draw text
if (instance_number(object_index) > 1) instance_destroy();

//keybind
scroll_key = command_pressed()
//view
pos_x = camera_get_view_x(view_camera[0]);
pos_y = camera_get_view_y(view_camera[0]) + 140;

//----setup----//
if setup == false{
	setup = true;
	draw_set_font(fnt_determination_mono);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	//loop through pages
	pages = array_length(text)
	for(var p = 0; p < pages; p++){
		text_length[p] = string_length(text[p]);
		//textbox x position find
		//no character (center)
		text_x_offset[p] = 24; 
	}
}

//----type txt here----//
if chars < text_length[page]{
	chars += spd
	chars = clamp(chars, 0, text_length[page]);
}
//continue page
if scroll_key{
	if chars == text_length[page]{ // if typing done
		if page < (pages - 1){
			page++;
			chars = 0;
		}
		else{
			instance_destroy(); // kill box
		}
	}
}

//----draw box----//
draw_sprite_ext(spr_textbox, img, 
	pos_x + text_x_offset[page], 
	pos_y, 
	box_width/spr_width, 
	box_height/spr_height, 
	0, c_white, 1)

draw_chars = string_copy(text[page], 1, chars);
draw_text_ext(pos_x + text_x_offset[page] + border, pos_y + border, draw_chars, line_sep, line_width);

//----options----//
if ((chars == text_length[page]) && (page == pages - 1)){
	for (var op = 0; op < option_number; op++){
		draw_chars = string_copy(text[page], 1, chars);
		options_space = 24*op
		draw_text(pos_x + options_border, pos_y + options_offset + options_space, option[op]);	
	}
}