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
	else
	{
		cur_death_checkpoint = noone;
	}
	
	// check if player is touching a generator
	if (place_meeting(x, y, obj_generator))
	{
		cur_generator = instance_nearest(x, y, obj_generator);
		is_on_generator = true;
	}
	else {
		cur_generator = noone;
		is_on_generator = false;
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
	
	// prevent double jump if holding item
	if (held_item != noone) has_double_jump = false;

	// jump
	if (key_jump) {
	    jump_buffer_timer = jump_buffer_time * ROOM_SPEED;
	}

	if (jump_buffer_timer > 0) {
	    if (coyote_timer > 0) { // Can jump during coyote time
			// play sound
			audio_sound_pitch(snd_jump, random_range(0.8, 1.2));
			audio_play_sound(snd_jump, 1, false, 1*global.volume);
	        vsp = jump_force;
	        coyote_timer = 0; // consume coyote time
	        jump_buffer_timer = 0;
	        grounded = false;
	    } else if (has_double_jump) {
			// play sound
			audio_sound_pitch(snd_jump, random_range(0.8, 1.2));
			audio_play_sound(snd_jump, 1, false, 1*global.volume);
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
	
	// hang onto item
	if (held_item != noone)
	{
		held_item.x = x+4;
		held_item.y = y-8;
		if (held_item == obj_robot)
		{
			held_item.x = x+8;
			held_item.y = y-12;
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
	// lines for "Acheivments"
	if (global.player_deaths >= 10) global.dialogue_id = 9;
	if (global.player_deaths >= 100) global.dialogue_id = 10;
	
	// lava check-----------------------------------------------------
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
			if (on_fire_countdown <= 0) 
			{
				KillPlayer();
				if (cur_death_checkpoint == noone) ResetPlayer();
			}
		}
	}
	else
	{
		if (on_fire_countdown >= 0 && on_fire_countdown < max_on_fire_time)
		{
			on_fire_countdown += 0.1;
			if (on_fire_countdown >= max_on_fire_time) is_on_fire = false;
		}
	}
	
	// spikes check -----------------------------------------------------
	if (place_meeting(x, y, obj_spikes))
	{
		KillPlayer();
		if (cur_death_checkpoint == noone) ResetPlayer();
	}
	
	// poison check -------------------------------------------------------
	if (drank_poison)
	{
		poison_countdown--;
		if (poison_countdown <= 0)
		{
			KillPlayer();
			if (cur_death_checkpoint == noone) ResetPlayer();	
		}
	}
	else
	{
		poison_countdown = max_poison_time
	}
	
	// ghost check ----------------------------------------------------------
	if (place_meeting(x, y, obj_ghost))
	{
		var _ghost = instance_nearest(x, y, obj_ghost);
		if (_ghost.is_active)
		{
			global.dialogue_id = 7;
			if (cur_death_checkpoint == noone)
			{
				KillPlayer();
				ResetPlayer();
			}
			else
			{
				KillPlayer();
			}	
		}
	}
	
	// battery check----------------------------------------------------------------------
	if (ate_battery)
	{
		battery_countdown--;
		
		if (battery_countdown == (max_battery_time/3)*2) battery_pulse = 2;
		if (battery_countdown == (max_battery_time/3)) battery_pulse = 3;
		
		if (battery_countdown <= 0)
		{
			KillPlayer();
			if (cur_death_checkpoint == noone) {
				global.dialogue_id = 6;
				ResetPlayer();	
			}
		}
	}
	else
	{
		battery_countdown = max_battery_time;
	}
}

function KillPlayer()
{
	is_dead = true;
	global.player_deaths += 1;
	
	// if holding an item
	if (held_item != noone) {
		held_item.ResetItem();
		held_item = noone;
	}
	
	// create ghost
	if (!place_meeting(x, y, obj_spawn_area))
	{
		if (instance_exists(obj_ghost)) instance_destroy(obj_ghost);
		instance_create_layer(x, y, "Instances", obj_ghost);
	}
}

function ResetPlayer()
{
	// play sound
	audio_sound_pitch(snd_death, random_range(0.9, 1.1));
	audio_play_sound(snd_death, 2, false, 0.5*global.volume);
	obj_player.x = obj_player.reset_x;
	obj_player.y = obj_player.reset_y;
	obj_player.is_dead = false;
	obj_player.dying = false;
	obj_player.is_on_fire = false;
	obj_player.drank_poison = false;
	obj_player.ate_battery = false;
	obj_player.battery_pulse = 0;
	obj_player.on_fire_countdown = obj_player.max_on_fire_time;
	obj_item.ResetItem();	
}

function CheckPlayerPickup()
{
	if (place_meeting(x, y, obj_item) && held_item == noone)
	{
		held_item = instance_nearest(x ,y, obj_item);
	}
	if (place_meeting(x, y, obj_robot) && held_item == noone && global.generators_powered == 4)
	{
		held_item = obj_robot;
	}
}
