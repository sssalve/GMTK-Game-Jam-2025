cam_width = 320;
cam_height = 180;

follow_target = obj_player;

x_to = follow_target.x;
y_to = follow_target.y;

cam_speed = 15;

cam_zoom = false;
zoom_target_ratio = 0.2;
zoom_speed = 0.05;
current_zoom = 1;
default_cam_width = camera_get_view_width(view_camera[0]);
default_cam_height = camera_get_view_height(view_camera[0]);