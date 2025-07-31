// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerMove(){
	// input
	var key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	var key_jump_held = keyboard_check(vk_space) || keyboard_check(ord("W")) || keyboard_check(vk_up);
	var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var key_right= keyboard_check(vk_right) || keyboard_check(ord("D"));

	// get tilemap for collision
	var collision_layer = layer_tilemap_get_id("Ground");
	// check if in death checkpoint zone
	if (place_meeting(x, y, obj_death_checkpoint))
	{
		cur_death_checkpoint = instance_nearest(x, y, obj_death_checkpoint);
	}

	// horizontal move
	var move = (key_right - key_left) * move_speed;
	hsp = move;

	// update direction
	if (move != 0)
	{
		facing = sign(move);
		is_moving = true;
	}
	else is_moving = false;

	// gravity
	if (!grounded)
	{
		vsp += p_gravity;
		if (vsp > max_fall_speed)
		{
			vsp = max_fall_speed;
		}
	}

	grounded = (instance_place(x, y + 1, collision_layer) != noone || instance_place(x, y + 1, obj_solid) != noone); 

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
	    if (instance_place(x + hsp, y, collision_layer) != noone || instance_place(x + hsp, y, obj_solid) != noone) {
	        // move as close as possible to the wall
	        var _step = sign(hsp);
	        while (instance_place(x + _step, y, collision_layer) == noone && instance_place(x + _step, y, obj_solid) == noone) {
	            x += _step;
	        }
	        hsp = 0;
	    }
	    x += hsp;
	}

	// vertical collision
	if (vsp != 0) {
	    if (instance_place(x, y + vsp, collision_layer) != noone || instance_place(x, y + vsp, obj_solid) != noone) {
	        // move as close as possible to the floor/ceiling
	        var _step = sign(vsp);
	        while (instance_place(x, y + _step, collision_layer) == noone && instance_place(x, y + _step, obj_solid) == noone) {
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
	    if (instance_place(x, y + 1, collision_layer) != noone || instance_place(x, y + 1, obj_solid) != noone) {
	        grounded = true;
	    }
	}
}
	
function AnimatePlayer()
{

	if (is_moving) {
	    anim_timer += 1;
	    if (anim_timer >= anim_speed * ROOM_SPEED) {
	        anim_timer = 0;
	        anim_frame = (anim_frame + 1) % 4; // loop through 4 frames (0-3)
	    }
		
		// use direction
	    if (facing > 0) {
	        image_index = 5 + anim_frame; // right frames (5-8)
	    } else {
	        image_index = 1 + anim_frame; // left frames (1-4)
	    }
	} else {
	    image_index = 0; // first is idle
	    anim_frame = 0;
	    anim_timer = 0;
	}

	// normal speed
	image_speed = 1;	
}

function CheckPlayerDeath()
{
	
	// lava check
	if (place_meeting(x, y, obj_lava))
	{
		if (!is_on_fire)
		{
			is_on_fire = true;
			on_fire_countdown = max_on_fire_time;
		}
		else
		{
			on_fire_countdown -= 1;
			if (on_fire_countdown <= 0) KillPlayer();
		}
	}
	else
	{
		is_on_fire = false;
	}
}

function KillPlayer()
{
	is_dead = true;
	global.player_deaths += 1;
}

function ResetPlayer()
{
	obj_player.x = obj_player.reset_x;
	obj_player.y = obj_player.reset_y;
	obj_player.is_dead = false;
}