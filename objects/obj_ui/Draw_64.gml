if (global.game_paused) {
    // dark overlay
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    var _w = 300, _h = 200;
    var _x = (display_get_gui_width() - _w) / 2;
    var _y = (display_get_gui_height() - _h) / 2;
    
    
    draw_set_halign(fa_center); 
    draw_set_font(fnt_menu);
    var _item_y = _y + 70;
    var _item_height = 30;
    
    for (var i = 0; i < array_length(menu_items); i++) {
        var _color = (i == current_menu_item) ? c_yellow : c_white;
        draw_set_color(_color);
        draw_text(_x + _w/2, _item_y + (i * _item_height), menu_items[i]);
    }
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
	draw_set_font(fnt_dialogue);
}