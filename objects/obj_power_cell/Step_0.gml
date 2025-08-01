function DoSomething()
{
	x = -10;
	y = -10;
	if (obj_player.is_on_generator && !obj_player.cur_generator.is_powered)
	{
		obj_player.cur_generator.is_powered = true;
		global.generators_powered += 1;
		instance_destroy(self, true);
	}
	else
	{
		obj_player.ate_battery = true;
		obj_player.battery_pulse = 1;
		ResetItem();
	}
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