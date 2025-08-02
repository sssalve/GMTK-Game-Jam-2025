if (room == rm_main_menu)
{
	if (global.escaped_with_robot == true)
	{
		visible = true;
	}
	else
	{
		visible = false
	}
}
else if (room == rm_level)
{
	visible = true;
}