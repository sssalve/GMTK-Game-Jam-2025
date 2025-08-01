if (global.generators_powered == 4)
{
	if (place_meeting(x, y, obj_player))
	{
		global.escaped = true;
		obj_camera.cam_zoom = true;
	}
}