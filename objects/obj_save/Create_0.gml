/// @description Insert description here
// You can write your code in this editor
event_inherited();

save_file = "save_file.ini"
function interact(){
	ini_open(save_file);
	ini_write_real("save", "score", 0);
	ini_close();
}

