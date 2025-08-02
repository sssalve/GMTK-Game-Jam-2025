if (global.player_deaths > 0)
{
	if (global.game_completed)
	{
		draw_set_font(fnt_dialogue);
		draw_text(x, y-15, FormatTime(obj_game_control.game_time));
	}
	draw_set_font(fnt_techy);
	draw_text(x, y, "Deaths: " + string(global.player_deaths));
}

