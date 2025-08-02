var _player = obj_player;

if (obj_player.cur_death_checkpoint == self.id && obj_player.is_dead)
{
	switch (on_death_effect)
	{
		case 0:
			ResetPlayer();
			break;
		case 1: // gate top right of spawn room
			if (true) // a relic of changing to spikes instead of fire
			{
				if (instance_exists(obj_door_1))
				{
					instance_deactivate_object(obj_door_1);
					global.dialogue_id = 1;
					audio_play_sound(snd_door_open, 1, false);
				}
				ResetPlayer();	
			}
			break;
		case 2: // door to left of spawn
			if (instance_exists(obj_door_2))
			{
				instance_deactivate_object(obj_door_2);
				audio_play_sound(snd_door_open, 1, false);
			}
			ResetPlayer();
			break;
		case 3: // hidden door above spawn
			if (instance_exists(obj_door_3))
			{
				instance_deactivate_object(obj_door_3);
				global.dialogue_id = 4;
				audio_play_sound(snd_door_open, 1, false);
			}
			ResetPlayer();
			break;
		case 4: // the door beneath the lava
			if (instance_exists(obj_door_4) && _player.drank_poison)
			{
				instance_deactivate_object(obj_door_4);
				global.dialogue_id = 3;
				audio_play_sound(snd_door_open, 1, false);
			}
			ResetPlayer();
			break;
		case 5: // spawn trapdoor
			if (instance_exists(obj_door_5) && _player.drank_poison)
			{
				instance_deactivate_object(obj_door_5);
				audio_play_sound(snd_door_open, 1, false);
				global.dialogue_id = 11;
			}
			ResetPlayer();
			break;
		case 6: // door to exit from spawn
			if (instance_exists(obj_door_6))
			{
				instance_deactivate_object(obj_door_6);
				instance_deactivate_object(obj_door_8);
				audio_play_sound(snd_door_open, 1, false);
				global.dialogue_id = 5;
			}
			ResetPlayer();
			break;
		case 7: // fire gauntlet door
			if (instance_exists(obj_door_7))
			{
				instance_deactivate_object(obj_door_7);
				global.dialogue_id = 8;
				audio_play_sound(snd_door_open, 1, false);
			}
			ResetPlayer();
			break;
		case 8:
			if (instance_exists(obj_door_9))
			{
				instance_deactivate_object(obj_door_9);
				audio_play_sound(snd_door_open, 1, false);
			}
			ResetPlayer();
			break;
	}
}