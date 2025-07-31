if (obj_player.cur_death_checkpoint == self.id && obj_player.is_dead)
{
	switch (on_death_effect)
	{
		case 1: // gate top right of spawn room
			if (instance_exists(obj_door_one))
			{
				instance_destroy(obj_door_one, true);
			}
			ResetPlayer();
			break;
			
	}
}