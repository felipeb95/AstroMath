if(moving_text){
	x += aceleration;
	first_number_x += aceleration;
	first_x += aceleration;
	aceleration += 0.5;
	show_debug_message("X value is : "+string(x));
	if(x > room_width/2-1)
		moving_text = false;
}