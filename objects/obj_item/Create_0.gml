/// @description Insert description here
// You can write your code in this editor
// info drop
event_inherited()

/// obj_item: sets text description
function set_info(){
}

/// obj_item: retrieves text from set_info and draws it
function get_info(){
	set_info();
	make_textbox();
}

function drop(){
	instance_destroy()
}

function use(){
}