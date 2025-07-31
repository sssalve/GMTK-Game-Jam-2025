var _player = obj_player;

if (obj_player.cur_death_checkpoint == self.id && obj_player.is_dead)
{
	switch (on_death_effect)
	{
		case 0:
			ResetPlayer();
			break;
		case 1: // gate top right of spawn room
			if (_player.is_on_fire)
			{
				if (instance_exists(obj_door_1))
				{
					instance_deactivate_object(obj_door_1);
				}
				else instance_activate_object(obj_door_1); //instance_create_layer(672, 240, "Instances", obj_door_1);
				ResetPlayer();	
			}
			break;
		case 2: // door to left of spawn
			if (instance_exists(obj_door_2))
			{
				instance_deactivate_object(obj_door_2);
			}
			ResetPlayer();
			break;
		case 3: // hidden door above spawn
			if (instance_exists(obj_door_3))
			{
				instance_deactivate_object(obj_door_3);
			}
			else instance_activate_object(obj_door_3);
			ResetPlayer();
			break;
		case 4:
			if (instance_exists(obj_door_4))
			{
				instance_deactivate_object(obj_door_4);
			}
			else instance_activate_object(obj_door_4);
			break;
	}
}