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
					global.dialogue_id = 1;
				}
				else {
					instance_activate_object(obj_door_1); //instance_create_layer(672, 240, "Instances", obj_door_1);
					global.dialogue_id = 2;				
				}
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
				global.dialogue_id = 4;
			}
			else instance_activate_object(obj_door_3);
			ResetPlayer();
			break;
		case 4: // the door beneath the lava
			if (instance_exists(obj_door_4) && _player.drank_poison)
			{
				instance_deactivate_object(obj_door_4);
				global.dialogue_id = 3;
			}
			else instance_activate_object(obj_door_4);
			ResetPlayer();
			break;
		case 5: // spawn trapdoor
			if (instance_exists(obj_door_5) && _player.drank_poison)
			{
				instance_deactivate_object(obj_door_5);
			}
			else instance_activate_object(obj_door_5);
			ResetPlayer();
			break;
		case 6:
			if (instance_exists(obj_door_6))
			{
				instance_deactivate_object(obj_door_6);
				instance_activate_object(obj_door_5);
			}
			else instance_activate_object(obj_door_6);
			ResetPlayer();
			break;
	}
}