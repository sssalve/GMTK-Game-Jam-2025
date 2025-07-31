if (follow_target != noone)
{
	x_to = follow_target.x;
	y_to = follow_target.y;
}

x += (x_to - x)/cam_speed;
y += (y_to - y)/cam_speed;

camera_set_view_pos(view_camera[0], x-(cam_width/2), y-(cam_height/2));