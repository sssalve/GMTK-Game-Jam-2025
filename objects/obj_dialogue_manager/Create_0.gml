global.dialogue_id = 0; // -1 means no dialogue happens
// dialoge finished for each option
// 0 means not done, 1 means finished
global.dialogue_flags = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 

dialogue_lines= [];

current_line = 0;

dialogue_text = "";

depth = -100;

min_read_time = 1.5 * ROOM_SPEED;
read_timer = min_read_time;
can_progress = false;