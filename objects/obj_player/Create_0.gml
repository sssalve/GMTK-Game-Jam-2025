move_speed = 2;
jump_force = -3.2;
p_gravity = 0.2;
max_fall_speed = 8;

// jump variables
has_double_jump = true;
coyote_time = 0.1;
jump_buffer_time = 0.1;

// internal
hsp = 0;
vsp = 0;
grounded = false;
coyote_timer = 0;
jump_buffer_timer = 0;
facing = 1;
reset_x = x;
reset_y = y;

// animation
anim_frame = 0;
anim_speed = 0.2; 
anim_timer = 0;
is_moving = false;

// death checks
is_on_fire = false;
max_on_fire_time = 180; // 3 seconds
on_fire_countdown = 0;