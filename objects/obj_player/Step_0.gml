if (!global.game_paused && !global.in_dialogue){

PlayerMove();	
AnimatePlayer();
CheckPlayerDeath();
CheckPlayerPickup();

if (held_item != noone)
{
	if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter))
	{
		held_item.DoSomething();
		held_item = noone;
	}
}

} //end of game paused check
else if (global.in_dialogue)
{
	if (keyboard_check_pressed(vk_space) || keyboard_check(vk_enter))
	{
		obj_dialogue_manager.current_line++;
	}
}