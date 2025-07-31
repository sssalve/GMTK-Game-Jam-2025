var draw_color = c_white;

if (drank_poison)
{
	draw_color = c_green;
}

if (ate_battery)
{
	battery_flicker = !battery_flicker;
	if (battery_flicker) draw_color = c_yellow;
	else draw_color = c_purple;
}


draw_sprite_ext(spr_player, image_index, x, y, 1, 1, 0, draw_color, 1);

