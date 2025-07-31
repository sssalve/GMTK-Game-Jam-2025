var draw_color = c_white;

if (drank_poison)
{
	draw_color = c_green;
}


draw_sprite_ext(spr_player, image_index, x, y, 1, 1, 0, draw_color, 1);

