global.dialogue_id = 0; // -1 means no dialogue happens
// dialoge finished for each option
// 0 means not done, 1 means finished
global.dialoge_flags = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
global.dialogue_progress = 0;

dialogue_lines= [];

current_line = 0;

dialogue_text = "";