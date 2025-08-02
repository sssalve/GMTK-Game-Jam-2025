if (room == rm_main_menu) {
    flash_timer += flash_speed;
    
    flash_alpha = 0.5 + abs(sin(flash_timer)) * 0.5;
    
    show_text = (sin(flash_timer) > 0);
}