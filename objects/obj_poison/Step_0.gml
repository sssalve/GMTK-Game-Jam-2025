function DoSomething()
{
	x = -10;
	y = -10;
	obj_player.drank_poison = true;
	obj_player.held_item = noone;
	obj_player.has_double_jump = true;
	ResetItem();
}

function ResetItem()
{
	x = reset_x;
	y = reset_y;
}