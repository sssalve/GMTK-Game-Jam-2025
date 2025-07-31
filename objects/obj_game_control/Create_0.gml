// main game control
global.current_room = rm_main_menu;
global.player_deaths = 0;
global.game_paused = false;
global.in_dialogue = false;
global.dev_mode = false; // no dialogue triggers

// door generators powerd flags
global.generators_powered = [0, 0, 0, 0];