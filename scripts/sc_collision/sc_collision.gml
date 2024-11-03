function collision(pos_x, pos_y){
	pinger = instance_create_layer(pos_x, pos_y, "Instances", obj_pinger);
	collided = pinger.check_collision();
	instance_destroy(pinger);
	return collided;
}