if (obj_player.cur_death_checkpoint == self.id && obj_player.is_dead)
{
	switch (on_death_effect)
	{
		case 0:
			ResetPlayer();
			break;
		case 1: // gate top right of spawn room
			if (instance_exists(obj_door_1))
			{
				instance_destroy(obj_door_1, true);
			}
			else instance_create_layer(672, 240, "Instances", obj_door_1);
			ResetPlayer();
			break;
		case 2:
			if (instance_exists(obj_door_2))
			{
				instance_destroy(obj_door_2, true);
			}
			ResetPlayer();
			break;
		case 3:
			if (instance_exists(obj_door_3))
			{
				instance_destroy(obj_door_3, true);
			}
			ResetPlayer();
			break;
	}
}