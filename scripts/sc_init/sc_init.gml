gml_pragma("global", "sc_init()")

global.dth = 0
global.fun = 0
global.dialogue_in_progress = false
global.inventory_displayed = false
global.battle_in_progress = false;
global.inventory = new Inventory()
global.player_stats = init_stats()
torn_notebook = new Torn_Notebook()
global.active_item = torn_notebook
global.player_name = "Boo!"

// key press defines
/// Z, enter, space or left mouse
function command_pressed() {
	return keyboard_check_pressed(ord("Z")) 
	|| keyboard_check_pressed(vk_enter) 
	|| keyboard_check_pressed(vk_space) 
	|| mouse_check_button_pressed(mb_left)
}

/// X, shift or right mouse
function quit_pressed() {
	return keyboard_check_pressed(ord("X")) 
	|| keyboard_check_pressed(vk_shift) 
	|| mouse_check_button_pressed(mb_right)
}

/// I, C or ctrl
function inventory_pressed() {
	return keyboard_check_pressed(ord("I"))
	|| keyboard_check_pressed(ord("C"))
	|| keyboard_check_pressed(vk_control)
}

function right_press(){
	return keyboard_check(ord("D")) || keyboard_check(vk_right)
}

function left_press(){
	return keyboard_check(ord("A")) || keyboard_check(vk_left);
}

function up_press(){
	return keyboard_check(ord("W")) || keyboard_check(vk_up)
}

function down_press(){
	return keyboard_check(ord("S")) || keyboard_check(vk_down)
}

function right_pressed(){
	return keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)
}

function left_pressed(){
	return keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
}

function up_pressed(){
	return keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)
}

function down_pressed(){
	return keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)
}