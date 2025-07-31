draw_set_font(fnt_techy);
if (global.player_deaths > 0)
{
	draw_text(x, y, "Deaths: " + string(global.player_deaths));
}