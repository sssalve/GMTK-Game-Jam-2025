flash_speed = 0.05;
flash_timer = 0;
flash_alpha = 1;
show_text = true;

title_x = room_width/2;
title_y = room_height/3;
start_x = room_width/2;
start_y = room_height/2;

depth = -100;

current_menu_item = 0;
menu_cooldown = 0;
volume_level = round(global.volume * 10);

menu_items = [
	"Continue",
	"Main Menu",
	"Volume: <" + string(volume_level) + ">",
	"Reset Game Data"
];