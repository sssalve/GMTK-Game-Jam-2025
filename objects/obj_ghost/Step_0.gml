if (!global.game_paused) {

var _player = instance_find(obj_player, 0);

if (instance_exists(_player)) {
    var _dist = point_distance(x, y, _player.x, _player.y);
    
    switch (state) {
        case "Calm":
			if (!is_active)
			{
				time_till_active -= 1;
				if (time_till_active <= 0) is_active = true;
			}
			else 
			{
			    // player detection
	            if (_dist < detection_radius) {
	                state = "Alert";
	                alert_countdown = max_alert_countdown;
	            }
            
	            // hover effect
	            hover_offset += hover_speed;
	            y += sin(hover_offset) * hover_height;
	            break;
            	
			}
			break;
        case "Alert":
            alert_countdown--;
            
            // visual feedback 
            image_alpha = 0.5 + (0.5 * (alert_countdown / max_alert_countdown));
            
            if (alert_countdown <= 0) {
                state = "Aggro";
            }
            
            // player left detection radius
            if (_dist > detection_radius) {
                state = "Calm";
                image_alpha = 1;
            }
            break;
            
        case "Aggro":
            // move toward player
            var _dir = point_direction(x, y, _player.x, _player.y);
            h_speed = lerp(hspeed, lengthdir_x(follow_speed, _dir), acceleration);
            v_speed = lerp(vspeed, lengthdir_y(follow_speed, _dir), acceleration);
            
            x += h_speed;
            y += v_speed;
            
            // check if player escaped
            if (_dist > escape_radius) {
                state = "Calm";
                h_speed = 0;
                v_speed = 0;
            }
            break;
    }
}

// smooth hover in all states
hover_offset += hover_speed;
y += sin(hover_offset) * (hover_height * (state == "Calm" ? 1 : 0.5));

// glitch
if (glitch_enabled) {
    var _chance = glitch_chance; 
    
    // adjust based on state
    switch (state) {
        case "Alert": _chance *= 1; break;
        case "Aggro": _chance *= 4; break; 
    }
    
    if (glitch_timer > 0) {
        glitch_timer--;
        if (glitch_timer <= 0) image_index = normal_image;
    } else if (random(1) < _chance) {
        image_index = glitch_images[irandom(1)];
        glitch_timer = glitch_duration;
    }
}

} // end of game paused check

depth = -1;