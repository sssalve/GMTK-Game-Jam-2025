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
	if (keyboard_check_pressed(vk_escape)) global.game_paused = !global.game_paused;
}

if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(ord("D")))
{
	global.dev_mode = !global.dev_mode;	
}