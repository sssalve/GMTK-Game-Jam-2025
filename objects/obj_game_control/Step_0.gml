// while in main menu
if (global.current_room = rm_main_menu)
{
	// start game
	if (keyboard_check_pressed(vk_space))
	{
		global.current_room = rm_level;
		global.player_deaths = 0;
		global.half_way = false;
		room_goto(rm_level);
	}
	if (keyboard_check_pressed(vk_escape))
	{
		game_end();
	}
}
else if (global.current_room = rm_level)
{
	if (keyboard_check_pressed(vk_escape)) global.game_paused = !global.game_paused;
	
	// half way check
	if (global.generators_powered >= 1)
	{
		global.half_way = true;
	}
	
	// leave level
	if (global.escaped && global.exit_level)
	{
		room_goto(rm_main_menu);
		global.current_room = rm_main_menu;
		global.game_paused = false;
		global.in_dialogue = false;
	}
}

if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(ord("D")))
{
	global.dev_mode = !global.dev_mode;	
}