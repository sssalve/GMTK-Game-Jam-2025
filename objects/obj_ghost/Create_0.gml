state = "Calm" // Can be "Calm" or "Aggro"

// activation time
time_till_active = 3 * ROOM_SPEED;
is_active = false;


// radiuses
detection_radius = 100; // distance for the player to be tetected
aggro_radius = 50; // aggro radius
escape_radius = 80;

max_alert_countdown = 1 * ROOM_SPEED; // time the player can spend in detection radius before aggro
alert_countdown = max_alert_countdown;

// movement
hover_height = 0.2; // hover oscillation height
hover_speed = 0.05; // hover oscillation speed
follow_speed = 1.5; // speed when following
acceleration = 0.2; // smooth follow movement
h_speed = 0;
v_speed = 0;

// visual
hover_offset = 0;

// glitch effect
glitch_enabled = true;
glitch_chance = 0.05; 
glitch_duration = 3; 
glitch_timer = 0;
normal_image = 0; 
glitch_images = [1, 2]; 