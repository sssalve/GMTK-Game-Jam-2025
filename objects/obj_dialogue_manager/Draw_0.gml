

if (!global.game_paused && global.in_dialogue)
{
	draw_set_font(fnt_dialogue);
	
    var h_padding = 10;  
    var v_padding = 10; 
    
    var text_width = string_width(dialogue_text);
    var text_height = string_height(dialogue_text);
    
    var box_width = text_width + h_padding;
	var box_height = text_height + v_padding;

    draw_sprite_stretched_ext(spr_dialogue_box, 0, 
                             x - box_width/2, y - box_height/2,
                             box_width, box_height, 
                             c_white, 1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(x, y, dialogue_text);
}