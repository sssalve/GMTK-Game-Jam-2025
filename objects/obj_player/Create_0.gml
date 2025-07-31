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
reset_x = 592;
reset_y = 384;

// items
held_item = noone;

// animation
anim_frame = 0;
anim_speed = 0.2; 
anim_timer = 0;
is_moving = false;
battery_flicker = false;

// death checks
cur_death_checkpoint = noone;
is_dead = false;
is_on_fire = false;
max_on_fire_time = 3 * 60; // 3 seconds
on_fire_countdown = max_on_fire_time;
is_on_spikes = false;
drank_poison = false;
max_poison_time = 10 * 60; // ten seconds
poison_countdown = max_poison_time;
ate_battery = false;
max_battery_time = 3 * 60; // 3 seconds
battery_countdown = max_battery_time;

// generators
cur_generator = noone;
is_on_generator = false;