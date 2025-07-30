// input
var key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
var key_jump_held = keyboard_check(vk_space) || keyboard_check(ord("W")) || keyboard_check(vk_up);
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right= keyboard_check(vk_right) || keyboard_check(ord("D"));

// get tilemap for collision
var collision_layer = layer_tilemap_get_id("Ground");

// horizontal move
var move = (key_right - key_left) * move_speed;
hsp = move;

// update direction
if (move != 0)
{
	facing = sign(move);
}

// gravity
if (!grounded)
{
	vsp += p_gravity;
	if (vsp > max_fall_speed)
	{
		vsp = max_fall_speed;
	}
}

grounded = (instance_place(x, y + 1, collision_layer) != noone); 

// coyote time logic
if (grounded) {
    coyote_timer = coyote_time * ROOM_SPEED; // reset timer when grounded
} else {
    coyote_timer--; // count down when in air
    if (vsp > 0 && coyote_timer <= 0) {
        grounded = false; 
    }
}

// jump
if (key_jump) {
    jump_buffer_timer = jump_buffer_time * ROOM_SPEED;
}

if (jump_buffer_timer > 0) {
    if (coyote_timer > 0) { // Can jump during coyote time
        vsp = jump_force;
        coyote_timer = 0; // consume coyote time
        jump_buffer_timer = 0;
        grounded = false;
    } else if (has_double_jump) {
        vsp = jump_force * 0.9;
        has_double_jump = false;
        jump_buffer_timer = 0;
    }
}

jump_buffer_timer--;

// variable jump height
if (!key_jump_held && vsp < jump_force/2) {
    vsp = jump_force/2;
}

// collision
var _xprevious = x;
var _yprevious = y;

// horizontal collision
if (hsp != 0) {
    if (instance_place(x + hsp, y, collision_layer) != noone) {
        // move as close as possible to the wall
        var _step = sign(hsp);
        while (instance_place(x + _step, y, collision_layer) == noone) {
            x += _step;
        }
        hsp = 0;
    }
    x += hsp;
}

// vertical collision
if (vsp != 0) {
    if (instance_place(x, y + vsp, collision_layer) != noone) {
        // move as close as possible to the floor/ceiling
        var _step = sign(vsp);
        while (instance_place(x, y + _step, collision_layer) == noone) {
            y += _step;
        }
        
        if (vsp > 0) {
			has_double_jump = true;
            grounded = true;
        }
        vsp = 0;
    } else {
        y += vsp;
        grounded = false;
    }
} 

// final ground check
if (vsp >= 0) { // only check if we're not moving up
    if (instance_place(x, y + 1, collision_layer) != noone) {
        grounded = true;
    }
}