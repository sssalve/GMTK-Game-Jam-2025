if (!global.game_paused && global.dialogue_id != -1)
{
	if (global.dialoge_flags[global.dialogue_id] == 0)
	{
		global.in_dialogue = true;
	}
	else
	{
		global.dialogue_id = -1
		return;
	}
	
	// dialogue
	switch (global.dialogue_id)
	{
		case 0:
			dialogue_lines = [
				"Hey, you look new here...",
				"Not much to do here, might as well just die",
				"Go on, do it. Nothing else to do"
			]
			break;
		case 1:
			dialogue_lines = [
				"Wait!! You're back!!",
				"And it seemed to open that door!",
				"Over to the right!!"
			]
			break;
	}
	
	// check if dialogue is done.
	if (current_line >= array_length(dialogue_lines))
	{
		global.dialoge_flags[global.dialogue_id] = 1;
		global.in_dialogue = false;
		global.dialogue_id = -1;
		current_line = 0;
	}
	else
	{
		dialogue_text = dialogue_lines[current_line];
	}
}