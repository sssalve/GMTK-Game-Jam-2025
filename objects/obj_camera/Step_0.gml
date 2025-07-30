var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);

// get position
var cam_x = (obj_player.x + (cam_lead * obj_player.facing)) - cam_width/2;
var cam_y = obj_player - cam_y/2;

// clamp  in room
cam_x = clamp(cam_x, 0 , room_width/2)