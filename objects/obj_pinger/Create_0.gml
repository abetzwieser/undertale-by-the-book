/// @description Init & detect collision
collide = false;

if place_meeting(x, y, obj_collision){
	// if obj has interact action
	// run itneract action
	collide = true;
}

function check_collision(){
	return collide;
}