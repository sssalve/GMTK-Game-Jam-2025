

if (global.current_room = rm_main_menu)
{
	draw_set_font(fnt_techy);
	draw_text(x, y, "Press any button to start");
}
else if (global.current_room = rm_level)
{
	draw_set_font(fnt_techy);
	draw_text(x, y, string(global.player_deaths));
	
}
