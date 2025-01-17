if(hascontrol and global.pause==false){
	//Teclas
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_up) or keyboard_check(ord("W"));

}
else{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//Movimiento
var move = key_right - key_left;
hsp = (move * walksp) + global.movimiento; //+ gunkickx;
view = global.Config == 1 ? sign(global.movimiento) : sign(move);
gunkickx = 0;
vsp = (vsp + grv); //+ gunkicky;
//gunkicky = 0;

canjump-=1;
if((canjump>0 and key_jump) or (canjump>0 and global.salto)){
	vsp = -13;
	canjump = 0;
	//global.salto = false;
}


//Colision horizontal
if(place_meeting(x+hsp,y,oWall)){
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Colision vertical
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animaciones
if(!place_meeting(x,y+1,oWall)){
	sprite_index = sPlayerA;
	image_speed = 0;
	if(sign(vsp)>0) image_index = 1;
	else image_index = 0;
}
else{
	canjump = 10;
	if(sprite_index==sPlayerA){
		audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
		audio_play_sound(snLanding,4,false);
		repeat(5){
			with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)){
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if(hsp==0) sprite_index = sPlayer;
	else sprite_index = sPlayerR;
}

if(hsp!=0) image_xscale = sign(hsp);