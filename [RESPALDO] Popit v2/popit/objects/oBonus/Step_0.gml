if(oscilate){
	image_angle += oscilationRate;
	if(image_angle >= maxDegree){
		oscilate = false;	
	}
}
else{
	image_angle -= oscilationRate;
	if(image_angle <= minDegree){
		oscilate = true;	
	}	
	
}

y += ySpeed;
if(y >= room_height-sprite_get_height(sCannon))
	instance_destroy(self);


