if (!global.game_paused && global.in_dialogue)
{
    var h_padding = 0;  // Reduced from 16 (horizontal only)
    var v_padding = 4; // Vertical padding stays the same
    
    // Calculate text dimensions
    var text_width = string_width(dialogue_text);
    var text_height = string_height_ext(dialogue_text, 1, -1);
    
    // Apply different padding to width vs height
    var box_width = text_width - 100;
    var box_height = text_height + v_padding * 2;
    
    // Draw the nine-slice sprite
    draw_sprite_stretched_ext(spr_dialogue_box, 0, 
                             x - box_width/2, y - box_height/2,
                             box_width, box_height, 
                             c_white, 1);
    
    // Draw the text with adjusted horizontal constraints
    draw_set_font(fnt_dialogue);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_ext(x, y, dialogue_text, -1, box_width - h_padding);
}