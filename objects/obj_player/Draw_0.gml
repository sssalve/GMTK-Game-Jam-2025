var draw_color = c_white;

if (drank_poison) {
    var poison_progress = 1 - (poison_countdown / max_poison_time);
    
    var time_remaining = poison_countdown / ROOM_SPEED;
    
    if (time_remaining > 1) { 
        draw_color = merge_color(
            draw_color,
            c_green,
            poison_progress * 0.7
        );
    }
    else {
        var flash_speed = 10;
        var flash_intensity = (1 + sin(player_current_time * flash_speed)) / 2;
        
        var flash_color = merge_color(c_green, c_red, flash_intensity);
        
        draw_color = merge_color(
            draw_color,
            flash_color,
            0.9
        );
    }
}

if (ate_battery)
{
	if (battery_pulse == 1) draw_color = c_yellow;
	if (battery_pulse == 2) draw_color = c_orange;
	if (battery_pulse == 3) draw_color = c_red;
}

if (is_on_fire)
{
    var burn_progress = 1 - (on_fire_countdown / max_on_fire_time);
    
    draw_color = merge_color(
        draw_color, 
        c_red,
        burn_progress
    );
    
    if (burn_progress > 0.3 && burn_progress < 0.7) {
        draw_color = merge_color(
            draw_color,
            c_orange,
            burn_progress * 0.7
        );
    }
}

draw_sprite_ext(spr_player, image_index, x, y, 1, 1, 0, draw_color, 1);

