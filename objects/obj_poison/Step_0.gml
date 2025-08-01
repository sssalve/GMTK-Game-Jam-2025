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

if (obj_player.held_item != self.id)
{
    hover_offset += hover_speed;
    y = reset_y + sin(hover_offset) * hover_height;
    
    image_angle = sin(hover_offset * 1.5) * 5;
}