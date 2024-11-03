/// @description Initialize textbox values
global.dialogue_in_progress = true;

depth = -999
box_width = 280;
box_height = 80;

pos_x = camera_get_view_x(view_camera[0]);
pos_y = camera_get_view_y(view_camera[0]) + 140;
spr_width = sprite_get_width(spr_textbox);
spr_height = sprite_get_height(spr_textbox);

border = 8;
line_sep = 15;
line_width = box_width - border * 2;
txtbox_spr = spr_textbox;
img = 0;
img_spd = 0;

//txt settings
page = 0
pages = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
chars = 0;
spd = 1;
draw_chars = "";

//options
option[0] = "";
option_link_id[0] = -1; // link options you choose
// with id of text u select :)
option_pos = 0;
option_number = 0;
options_space = 24;
options_border = 40;
options_offset = 30;

//other
setup = false;
cooldown = false; // will eventually need later thx
scroll_key = false;

function add_text(t){
	self.text[pages] = t;
	self.pages++;
}