switch (os_type){
   case os_windows: global.Config = 1; break;
   case os_android: global.Config = 2; break;
   case os_linux: global.Config = 1; break;
   case os_macosx: global.Config = 1; break;
   case os_ios: global.Config = 2; break;
}

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
if global.Config == 2
{
    layer_background_sprite(back_id, sWelcomeRoomBgMobile);
}
else
	layer_background_sprite(back_id, sWelcomeRoomBg);