if (!global.game_paused && global.dialogue_id != -1 && !global.dev_mode)
{
	if (global.dialogue_flags[global.dialogue_id] == 0)
	{
		global.in_dialogue = true;
	}
	else
	{
		global.dialogue_id = -1;
		return;
	}
	
	// dialogue
	switch (global.dialogue_id)
	{
		case 0: // intro
			dialogue_lines = [
				"Hey, you look new here...",
				"Not much to do here, might as well just die",
				"Go on, do it. Nothing else to do"
			]
			break;
		case 1: // first death
			dialogue_lines = [
				"Wait!! You're back!!",
				"Dying in that glitched area did somethig",
				"Looks like it opened that door over there",
				"You should go explore",
				"Maybe you'll find a way out of here!"
			]
			break;
		case 2: // closed door again lol
			dialogue_lines = [
				"Oops, That's embarassing",
				"Looks like you closed the door"
			]
			break;
		case 3: // death to poison
			dialogue_lines = [
				"Poison sucks. Takes so long",
				"I think it opened a new door though",
				"Under the lava up there"
			]
			break;
		case 4: // item introduction
			dialogue_lines = [
				"You can use an item by pressing E or Enter",
				"Pick them up by touching them",
				"They are heavy, so you cant double jump with them"
			]
			break;
		case 5:
			dialogue_lines = [
				"You seem to be making a lot of progress",
				"You must be getting really close to the exit",
				"If i remember correctly, the exit needs power",
				"You will have to find a source of electricity",
				"Then use it to power the exit door"
			]
	}
	
	// check if dialogue is done.
	if (current_line >= array_length(dialogue_lines))
	{
		global.dialogue_flags[global.dialogue_id] = 1;
		global.in_dialogue = false;
		global.dialogue_id = -1;
		current_line = 0;
	}
	else
	{
		dialogue_text = dialogue_lines[current_line];
	}
}