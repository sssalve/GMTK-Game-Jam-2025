move_speed = 1.8;
acceleration = 0.15;
deceleration = 0.25;
air_control = 0.15;
current_hsp = 0;
jump_force = -3.6;
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
max_on_fire_time = 1.8 * 60; // 3 seconds
on_fire_countdown = max_on_fire_time;
is_on_spikes = false;
drank_poison = false;
max_poison_time = 10 * 60; // ten seconds
poison_countdown = max_poison_time;
player_current_time = 0;
ate_battery = false;
max_battery_time = 3 * 60; // 3 seconds
battery_countdown = max_battery_time;
battery_pulse = 0;

// death animation
dying = false;
death_rotation = 0;       // Current rotation (0 = normal, 90 = facing up)
death_float_speed = 1;    // How fast player floats upward
death_fade_speed = 0.02;  // How fast player fades out
death_alpha = 1;          // Current transparency
death_complete = false;   // Tracks when animation finishes

// generators
cur_generator = noone;
is_on_generator = false;