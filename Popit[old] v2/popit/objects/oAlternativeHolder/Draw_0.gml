draw_self();
if(typeof(numberOnHolder) != "string")
	draw_set_font(fHolderNumber);
else
	draw_set_font(fHolderNumberDoesntApply);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_color(c_black)
draw_text(x+2,y-2,string(numberOnHolder));
draw_set_color(c_white);
draw_text(x,y,string(numberOnHolder));
