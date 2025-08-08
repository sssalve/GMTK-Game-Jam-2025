// main game control
global.current_room = rm_main_menu;
global.player_deaths = 0;
global.game_paused = false;
global.in_dialogue = false;
global.dev_mode = false; // no dialogue triggers
global.volume = 1;

// door generators powerd flags
global.generators_powered = 0;
global.escaped = false;
global.exit_level = false;
global.half_way = false;


// game completion stuff
global.game_completed = false;
global.best_time = 999999;
global.least_deaths = 999999;
game_time = 0;
global.escaped_with_robot = false;

LoadGame();