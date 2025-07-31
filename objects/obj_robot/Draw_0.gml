if (global.in_dialogue)
{
    var shake_x = sin(current_time * 0.2) * 2;
    var pulse = 1 + (sin(current_time * 0.15) * 0.03);
    
    draw_sprite_ext(spr_robot, 0, 
                   x + shake_x, y,
                   pulse, pulse, 
                   shake_x * 0.5, 
                   c_white, 1);
}
else
{
	draw_self();
}