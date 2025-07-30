// while in main menu
if (global.current_room = rm_main_menu)
{
	// start game
	if (keyboard_check_pressed(vk_anykey))
	{
		global.current_room = rm_level;
		room_goto(rm_level);
	}
}
else if (global.current_room = rm_level)
{
	
}