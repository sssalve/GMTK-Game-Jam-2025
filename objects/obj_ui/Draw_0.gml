if (room == rm_main_menu) {
    if (!global.escaped) {
        draw_set_font(fnt_techy);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_text_ext(title_x, title_y, "KILLOOP", -1, room_width*0.8);
        
        if (show_text) {
            draw_set_font(fnt_dialogue);
            draw_set_alpha(flash_alpha);
            draw_text_ext(start_x, start_y, "PRESS SPACE TO START", -1, room_width*0.6);
            
            draw_set_color(c_black);
            draw_text_ext(start_x+1, start_y+1, "PRESS SPACE TO START", -1, room_width*0.6);
            draw_set_color(c_white);
        }
    }
    else {
		draw_set_font(fnt_dialogue)
		draw_set_color(c_white);
		draw_text_ext(x+3, y, "Fastest Time: " + string(FormatTime(global.best_time)), -1, room_width*0.8);
		draw_text_ext(x+3, y+12, "Least Deaths: " + string(global.least_deaths), -1, room_width*0.8);
		
        draw_set_font(fnt_techy);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_green);
        
        draw_text_ext(title_x, title_y, "YOU ESCAPED!!", -1, room_width*0.8);
        draw_set_color(c_black);
        draw_text_ext(title_x+2, title_y-2, "YOU ESCAPED!!", -1, room_width*0.8);
        
        draw_set_font(fnt_techy);
        draw_set_color(c_white);
        var deaths_text = "DEATHS: " + string(global.player_deaths);
        draw_text_ext(start_x, start_y, deaths_text, -1, room_width*0.6);
        draw_set_color(c_black);
        draw_text_ext(start_x+1, start_y+1, deaths_text, -1, room_width*0.6);
        
        if (show_text) {
            draw_set_font(fnt_dialogue);
            draw_set_alpha(flash_alpha);
            draw_set_color(c_yellow);
            var continue_text = "PRESS SPACE TO PLAY AGAIN";
			var exit_text = "PRESS ESC TO EXIT"
            draw_text_ext(start_x, start_y+25, continue_text, -1, room_width*0.6);
            draw_set_color(c_black);
            draw_text_ext(start_x+1, start_y+26, continue_text, -1, room_width*0.6);
			draw_text_ext(start_x, start_y+40, exit_text, -1, room_width*0.6);
            draw_set_color(c_black);
            draw_text_ext(start_x+1, start_y+41, exit_text, -1, room_width*0.6);

        }
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}