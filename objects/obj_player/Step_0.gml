PlayerMove();	
AnimatePlayer();
CheckPlayerDeath();
CheckPlayerPickup();

if (held_item != noone)
{
	if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))
	{
		held_item.DoSomething();
		held_item = noone;
	}
}