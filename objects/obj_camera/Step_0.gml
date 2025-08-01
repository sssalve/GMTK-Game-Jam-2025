if (!global.game_paused) {
    var _cam = view_camera[0];

    if (follow_target != noone) {
        x_to = follow_target.x;
        y_to = follow_target.y;
    }

    x += (x_to - x)/cam_speed;
    y += (y_to - y)/cam_speed;

    if (cam_zoom) {
        current_zoom = lerp(current_zoom, zoom_target_ratio, zoom_speed);
        
        if (abs(current_zoom - zoom_target_ratio) < 0.01) {
            current_zoom = zoom_target_ratio;
        }
    } else {
        current_zoom = lerp(current_zoom, 1, zoom_speed);
    }

    var _view_width = default_cam_width * current_zoom;
    var _view_height = default_cam_height * current_zoom;
    
    var _cam_x = x - (_view_width/2);
    var _cam_y = y - (_view_height/2);
    
    camera_set_view_pos(_cam, _cam_x, _cam_y);
    camera_set_view_size(_cam, _view_width, _view_height);
    
	if (abs(current_zoom - zoom_target_ratio) < 0.01) global.exit_level = true; // mark as finished
	
    if (current_zoom == 1) {
        camera_set_view_size(_cam, default_cam_width, default_cam_height);
    }
}