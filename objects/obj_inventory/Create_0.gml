#region variable setup
border = 8;
space_bw_lines = 15;

// window sizes
main_window_width = 180;
main_window_height = 180;

side_window_width = 78;
side_window_height = 0.55 * main_window_height;

mini_window_width = side_window_width;
mini_window_height = main_window_height - side_window_height - border

spr_width = sprite_get_width(spr_inventory);
spr_height = sprite_get_height(spr_inventory);

spr_frame = 0;
cursor_frame = 0

// text settings
draw_set_font(fnt_determination_mono);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

max_lines_displayed = 0
lines_displayed = 0
starting_line = 0
text_offset_x = 12
text_offset_y = 8

// tab information
enum INVENTORY_TABS{
	CONSUMABLES,
	KEY_ITEMS,
	NOTEBOOK,
	STATS
}

tab_names_offset_x = 20
tab_names_offset_y = 8

cur_tab = INVENTORY_TABS.CONSUMABLES
tab_names = ["ITEMS", "TOOLS", "NBOOK", "STATS"];
tabs = [INVENTORY_TABS.CONSUMABLES, INVENTORY_TABS.KEY_ITEMS, INVENTORY_TABS.NOTEBOOK, INVENTORY_TABS.STATS]

// item information
consumables = [""];
key_items = [""];
items = [""];

actions = [""];
consumables_actions = ["USE", "INFO", "DROP"];
key_items_actions = ["HOLD", "INFO", "DROP"];

actions_text_offset = 24

// notebook information
notebook_pages = [""]

// player information overview
player_info_names = ["LV", "HP", "G"]
player_info_values = [string(global.player_stats.level), string(global.player_stats.hp) + "\/" + string(global.player_stats.base_hp), "0"]

// stats information
player_stats_names = ["LV", "HP", 
	"AT", "EXP:", "DF", "NEXT:", 
	"WEAPON:", "ARMOR:", "GOLD:"]
player_stats_values = [string(global.player_stats.level), string(global.player_stats.hp) + "\/" + string(global.player_stats.base_hp),
	string(global.player_stats.base_atk), "0", string(global.player_stats.base_def), "0",
	"NA", "NA", "0"]

// cursor information
cursor_offset_x = 6
cursor_offset_y = 2

enum WINDOW{
	MAIN_WINDOW,
	SIDE_WINDOW
}

enum SCROLL{
	ACTIONS,
	ITEMS
}
#endregion

/// gives Inventory the information it needs to display
function init(consumables, key_items, notebook){
	self.consumables = consumables;
	self.key_items = key_items;
	self.notebook_pages = notebook.get_pages()
}

#region macros
// main window
#macro main_window_text_height main_window_height - border * 2
#macro main_window_text_width main_window_width - border * 2

#macro max_items_text_y pos_y + main_window_text_height - (main_window_height / 7)
#macro items_text_x pos_x + border + text_offset_x
#macro main_window_text_y pos_y + text_offset_y

#macro actions_text_y max_items_text_y + actions_text_offset
#macro space_bw_actions (main_window_width - border*2) / array_length(self.actions)

#macro notebook_text_x pos_x + border

// side window
#macro side_window_y pos_y + main_window_height - side_window_height
#macro side_window_x pos_x - side_window_width - border

#macro tab_names_x side_window_x + tab_names_offset_x
#macro tab_names_y side_window_y + tab_names_offset_y
#macro space_bw_tab_names (side_window_height - border * 2) / (array_length(self.tab_names))

// mini window
#macro mini_window_y pos_y
#macro mini_window_x pos_x - mini_window_width - border

#macro mini_window_text_x mini_window_x + text_offset_x
#macro mini_window_text_y mini_window_y + text_offset_y

#endregion

#region functions: window/cursor display
function display_cursor(pos_x, pos_y){
	static window = WINDOW.SIDE_WINDOW
	var select = command_pressed()
	
	if window == WINDOW.MAIN_WINDOW {
		static main_window_cursor_pos = 0
		static main_window_min_scroll_y = main_window_text_y + cursor_offset_y
		var main_window_max_scroll_y = main_window_min_scroll_y + (self.lines_displayed * space_bw_lines)
		
		static main_window_cursor_x = pos_x + cursor_offset_x
		static main_window_cursor_y = main_window_min_scroll_y
		
		if cur_tab == INVENTORY_TABS.CONSUMABLES || cur_tab = INVENTORY_TABS.KEY_ITEMS {
			static scroll = SCROLL.ITEMS
	
			// NAVIGATION
			if scroll = SCROLL.ITEMS { // ITEMS
				
				if (main_window_cursor_y > main_window_max_scroll_y) { 
					main_window_cursor_y = main_window_max_scroll_y
					main_window_cursor_pos = self.lines_displayed
				}
				
				if (down_pressed()) {
					if (main_window_cursor_y < main_window_max_scroll_y) { 
						main_window_cursor_y += space_bw_lines
						main_window_cursor_pos += 1
					}
					else if (main_window_cursor_y == main_window_max_scroll_y && self.starting_line < self.max_lines_displayed) { 
						self.starting_line += 1 }
				}
				else if (up_pressed()) {
					if (main_window_cursor_y > main_window_min_scroll_y) { 
						main_window_cursor_y -= space_bw_lines
						main_window_cursor_pos -= 1
					}
					else if (main_window_cursor_y == main_window_min_scroll_y && self.starting_line > 0) { self.starting_line -= 1 }
				}
				else if (left_pressed()) {
					window = WINDOW.SIDE_WINDOW // exit main window, move to side window
				}
				else if (select) { // selecting item, move to actions
					scroll = SCROLL.ACTIONS
				}
				draw_sprite(spr_cursor, cursor_frame, main_window_cursor_x, main_window_cursor_y)
			} // end ITEMS
			else if scroll = SCROLL.ACTIONS { // ACTIONS
				static actions_cursor_y = actions_text_y + cursor_offset_y
				static actions_cursor_x = pos_x + cursor_offset_x
				static actions_cursor_pos = 0
			
				if (quit_pressed()) { // exit actions, move to items
					scroll = SCROLL.ITEMS
				}
				else if (right_pressed() && actions_cursor_pos < (array_length(self.actions)) - 1) {
					actions_cursor_x += space_bw_actions
					actions_cursor_pos += 1
				
				}
				else if (left_pressed() && actions_cursor_pos > 0) {
					actions_cursor_x -= space_bw_actions
					actions_cursor_pos -= 1
				}
				else if (select) { // selecting action
					show_debug_message("Action selected!")
					if (!global.dialogue_in_progress) { perform_action(actions_cursor_pos, main_window_cursor_pos) }
				}
				draw_sprite(spr_cursor, cursor_frame, actions_cursor_x, actions_cursor_y)
			} // end ACTIONS
		}
	// END MAIN WINDOW
	}
	else if window == WINDOW.SIDE_WINDOW {
		static side_window_cursor_pos = 0
		
		static side_window_min_scroll_y = tab_names_y + self.cursor_offset_y
		var side_window_max_scroll_y = side_window_min_scroll_y + (array_length(self.tab_names) - 1) * space_bw_tab_names
		
		static side_window_cursor_x = side_window_x + self.cursor_offset_x
		static side_window_cursor_y = side_window_min_scroll_y
		
		// NAVIGATION
		if (down_pressed()) {
			if (side_window_cursor_y < side_window_max_scroll_y) { 
				side_window_cursor_y += space_bw_tab_names 
				side_window_cursor_pos += 1
			}
		}
		else if (up_pressed()) {
			if (side_window_cursor_y > side_window_min_scroll_y) { 
				side_window_cursor_y -= space_bw_tab_names
				side_window_cursor_pos -= 1
			}
		}
		else if (right_pressed() && (cur_tab == INVENTORY_TABS.CONSUMABLES || cur_tab == INVENTORY_TABS.KEY_ITEMS)) { 
			window = WINDOW.MAIN_WINDOW // exit side window, move to main window
		}
		else if (select) {
			self.cur_tab = tabs[side_window_cursor_pos]
		}
		
		draw_sprite(spr_cursor, cursor_frame, side_window_cursor_x, side_window_cursor_y)	
	}
	// END SIDE WINDOW
}

function perform_action(cursor_pos, index) {
	var action = actions[cursor_pos]
	switch (action) {
		case "USE":
			if index < array_length(items) { items[index].use() }
			break
		case "HOLD":
			if index < array_length(items) { items[index].hold() }
			break
		case "INFO":
			if index < array_length(items) { items[index].info() }
			break
		case "DROP":
			if cur_tab == INVENTORY_TABS.CONSUMABLES { array_delete(items, index, 1) }
			else {
				with (new Textbox()) {
					// ask kody for items & item descriptions pls
					// random - progressive mean, then random
					// random fun 1 - 99
					store_text("[You're trying to drop a key item. Are you stupid?]")
					store_text("[... You're not dropping that.]")
					make_textbox()
				}
			}
			break
	}
}

function display_main_window(pos_x, pos_y){
	draw_sprite_ext(spr_inventory, spr_frame, 
		pos_x, 
		pos_y, 
		main_window_width/spr_width, 
		main_window_height/spr_height, 
		0, c_white, 1)
}

function display_tab_names(pos_x, pos_y) {
	var tab_y = tab_names_y
	for (var i = 0; i < array_length(self.tab_names); i++) {
			draw_text(tab_names_x, tab_y, tab_names[i]);
			tab_y += space_bw_tab_names
	}
}

function display_side_window(pos_x, pos_y){
	draw_sprite_ext(spr_inventory, spr_frame,
		side_window_x,
		side_window_y,
		side_window_width/spr_width,
		side_window_height/spr_height,
		0, c_white, 1)
		
	display_tab_names(pos_x, pos_y)
}

function display_player_info(pos_x, pos_y) {
	var player_info_y = mini_window_text_y
	var text_scale = 0.8
	var text_angle = 0
	
	draw_text(mini_window_text_x, player_info_y, global.player_name);
	player_info_y += (mini_window_height) / (array_length(self.player_info_names) + 1);
	
	for (var i = 0; i < array_length(player_info_names); i++) {
		draw_text_transformed(mini_window_text_x, player_info_y, player_info_names[i] + " " + player_info_values[i], text_scale, text_scale, text_angle);
		player_info_y += (mini_window_height - border * 2) / (array_length(self.player_info_names) + 1);
	}
}

function display_mini_window(pos_x, pos_y){
	draw_sprite_ext(spr_inventory, spr_frame,
		mini_window_x,
		mini_window_y,
		mini_window_width/spr_width,
		mini_window_height/spr_height,
		0, c_white, 1)
		
	display_player_info(pos_x, pos_y);
}

function display_windows(pos_x, pos_y) {
	display_main_window(pos_x, pos_y)
	display_side_window(pos_x, pos_y)
	display_mini_window(pos_x, pos_y)
}
#endregion

#region functions: tab information display

function display_actions(pos_text_x, pos_text_y){
	for(var i = 0; i < array_length(self.actions); i++) {
		draw_text(pos_text_x, pos_text_y, actions[i]);
		pos_text_x += space_bw_actions
	}
}
	
function display_items(pos_x, pos_y) {
	var pos_text_y = main_window_text_y
	for(var i = self.starting_line; i < array_length(self.items); i++){
		draw_text(items_text_x, pos_text_y, items[i].name)
		pos_text_y += space_bw_lines;
		self.lines_displayed = i - self.starting_line
		if pos_text_y >= max_items_text_y { 
			self.max_lines_displayed = i - self.starting_line
			break; 
		}
	}
}

function display_consumables(pos_x, pos_y){
	self.items = self.consumables
	
	display_items(pos_x, pos_y)
	
	self.actions = self.consumables_actions
	display_actions(items_text_x, actions_text_y)
}

function display_key_items(pos_x, pos_y){
	var pos_text_y = main_window_text_y
	self.items = self.key_items
	
	display_items(pos_x, pos_y)
	
	self.actions = self.key_items_actions
	display_actions(items_text_x, actions_text_y)
}

function display_notebook(pos_x, pos_y){
	var pos_text_y = main_window_text_y
	for(var i = self.starting_line; i < array_length(self.notebook_pages); i++){
		draw_text_ext(notebook_text_x, pos_text_y, notebook_pages[i], space_bw_lines, main_window_text_width)
		pos_text_y += space_bw_lines;
	}
}

function display_stats(pos_x, pos_y){
	var pos_text_y = main_window_text_y
	var shift_x = main_window_width / 2.4
	
	draw_text(items_text_x, pos_text_y, global.player_name);
	pos_text_y += space_bw_lines * 2;
	
	
	for (var i = 0; i < 2; i++){
		draw_text_ext(items_text_x, pos_text_y, player_stats_names[i] + " " + player_stats_values[i], space_bw_lines, main_window_text_width)
		pos_text_y += space_bw_lines
	}
	
	pos_text_y += space_bw_lines * 2;
	
	for (var i = 2; i < 6; i++) {
		if (i % 2 == 1) {
			draw_text_ext(items_text_x + shift_x, pos_text_y, player_stats_names[i] + " " + player_stats_values[i], space_bw_lines, main_window_text_width)
			pos_text_y += space_bw_lines
		}
		else {
			draw_text_ext(items_text_x, pos_text_y, player_stats_names[i] + " " + player_stats_values[i], space_bw_lines, main_window_text_width)
		}
	}
	
	pos_text_y += space_bw_lines * 2;
	draw_text_ext(items_text_x, pos_text_y, player_stats_names[array_length(player_stats_names) - 1] + " " + player_stats_values[array_length(player_stats_names) - 1], space_bw_lines, main_window_text_width)
	
}

function display_tab(pos_x, pos_y){
	switch (self.cur_tab) {
	case INVENTORY_TABS.KEY_ITEMS:  
		display_key_items(pos_x, pos_y);
		break;
	case INVENTORY_TABS.CONSUMABLES:
		display_consumables(pos_x, pos_y);
		break;
	case INVENTORY_TABS.NOTEBOOK:
		display_notebook(pos_x, pos_y);
		break;
	case INVENTORY_TABS.STATS:
		display_stats(pos_x, pos_y);
		break;
	}
}
#endregion}