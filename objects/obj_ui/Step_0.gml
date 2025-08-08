if (room == rm_main_menu) {
    flash_timer += flash_speed;
    
    flash_alpha = 0.5 + abs(sin(flash_timer)) * 0.5;
    
    show_text = (sin(flash_timer) > 0);
}

if (global.game_paused)
{
// input cooldown to prevent too fast navigation
    if (menu_cooldown > 0) {
        menu_cooldown--;
    } else {
        // enu navigation
        var _up = keyboard_check_pressed(vk_up);
        var _down = keyboard_check_pressed(vk_down);
        var _confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
        
        if (_up || _down) {
            current_menu_item = (current_menu_item + (_down ? 1 : -1)) mod array_length(menu_items);
            if (current_menu_item < 0) current_menu_item = array_length(menu_items) - 1;
            menu_cooldown = 10;
        }
        
        // volume adjustment
        if (current_menu_item == 2) {
            var _left = keyboard_check_pressed(vk_left);
            var _right = keyboard_check_pressed(vk_right);
            
            if (_left || _right) {
                volume_level = clamp(volume_level + (_right ? 1 : -1), 0, 10);
                global.volume = volume_level / 10; 
                menu_items[2] = "Volume: <" + string(volume_level) + ">";
                menu_cooldown = 8;
            }
        }
        
        // Menu confirmation
        if (_confirm) {
            switch (current_menu_item) {
                case 0: 
                    global.game_paused = false;
                    break;
                    
                case 1: 
                    room_goto(rm_main_menu);
                    global.game_paused = false;
                    break;
                    
                case 2: 
                    break;
                    
                case 3: 
                    if (file_exists("save_data.json")) {
                        file_delete("save_data.json");
						global.best_time = 99999;
						global.least_deaths = 99999;
						global.volume = 1;
						global.game_completed = false;
                    }
                    break;
            }
            menu_cooldown = 15;
        }
    }
}