// while in main menu
if (room = rm_main_menu)
{
	// start game
	if (keyboard_check_pressed(vk_space))
	{
		global.current_room = rm_level;
		global.player_deaths = 0;
		global.generators_powered = 0;
		global.escaped = false;
		global.exit_level = false;
		global.half_way = false;
		global.in_dialogue = false
		global.game_paused = false;
		global.escaped_with_robot = false;
		game_time = 0;
		room_goto(rm_level);
	}
	if (keyboard_check_pressed(vk_escape))
	{
		game_end();
	}
}
else if (room = rm_level)
{
	
	if (!global.game_paused) game_time++;
	
	if (keyboard_check_pressed(vk_escape)) global.game_paused = !global.game_paused;
	
	// half way check
	if (global.generators_powered >= 2)
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
		global.game_completed = true;
		// escape with robot check
		if (obj_player.held_item == obj_robot)
		{
			global.escaped_with_robot = true;
		}
		// new least deaths check
		if (global.player_deaths < global.least_deaths)
		{
			global.least_deaths = global.player_deaths;
		}
		// new best time check
		if (game_time < global.best_time)
		{
			global.best_time = game_time
		}
	}
}

if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(ord("D")))
{
	global.dev_mode = !global.dev_mode;	
}

//if (keyboard_check_pressed(ord("0")))
//{
//		room_goto(rm_main_menu);
//		global.current_room = rm_main_menu;
//		global.game_paused = false;
//		global.in_dialogue = false;
//		global.game_completed = true;
//		global.escaped = true;
//		// new least deaths check
//		if (global.player_deaths < global.least_deaths)
//		{
//			global.least_deaths = global.player_deaths;
//		}
//		// new best time check
//		if (game_time < global.best_time)
//		{
//			global.best_time = game_time
//		}
//}
