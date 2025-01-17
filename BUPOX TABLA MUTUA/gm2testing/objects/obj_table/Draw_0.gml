/* Lines to make the table */
draw_line_width(hline_x1,hline_y,hline_x2,hline_y,hline_width);
draw_line_width(vline_x, vline_y1, vline_x, vline_y2, vline_width);

/* Numbers of big bubbles placement */
draw_set_font(font_table_number);
draw_set_valign(fa_bottom);
draw_text(left_number_x, hline_y + hline_width+1, string(obj_spawner.left_to_table_header)); // Left Bubble Number
draw_text(right_number_x, hline_y + hline_width+1, string(obj_spawner.right_to_table_header)); // Right Bubble Number

/* Partials on table */

draw_set_valign(fa_middle);

if(!ds_list_empty(left_partials)){ // Any of the list can be used, as their partials list have the same size.
	
	for(i = 0; i < ds_list_size(left_partials); i++){
		draw_text(left_number_x, hline_y + first_partial_y + space_between_numbers*i, string(left_partials[| i]));
		draw_text(right_number_x, hline_y + first_partial_y + space_between_numbers*i, string(right_partials[| i]));
	}
	
	for(i = 0; i < ds_list_size(table_multiples); i++){ // If there are partials, there are multiples on table.
		if(i = 0){
			draw_set_valign(fa_bottom);
			draw_text(first_table_multiple_x, hline_y + hline_width+1, string(table_multiples[| i]));
		}
		else{	
			draw_set_valign(fa_middle);
			draw_text(first_table_multiple_x, hline_y + first_partial_y + space_between_numbers*(i-1), string(table_multiples[| i]));
		}
	}
}

draw_set_valign(fa_middle); // Vertical alignment reset.

/* Game instructions by phase */
draw_set_font(font_instructions);

if(obj_spawner.phaseOne)
	draw_text(room_width/2, 600, "Arrastra las burbujas pequeñas a las  grandes que pueda dividir");

if(obj_spawner.phaseTwo and !obj_multiples_list.moving_text)
	draw_text(room_width/2, room_height/2 + 70, "Revienta la burbuja con la respuesta haciendo click sobre ella");
	
draw_set_font(font_table_number); // Font reset