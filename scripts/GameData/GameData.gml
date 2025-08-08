// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	var save_data = ds_map_create();
	
	save_data[? "game_completed"] = global.game_completed;
	save_data[? "best_time"] = global.best_time;
	save_data[? "least_deaths"] = global.least_deaths;
	save_data[? "volume"] = global.volume;
	
	var json_string = json_encode(save_data);
	
	var file = file_text_open_write("save_data.json");
	file_text_write_string(file, json_string);
	file_text_close(file);
	
	ds_map_destroy(save_data);
}

function LoadGame() {
	if (file_exists("save_data.json"))
	{
		var file = file_text_open_read("save_data.json");
		var json_string = file_text_read_string(file);
		file_text_close(file);
		
		var save_data = json_decode(json_string);
		
		// completed check
		if (ds_map_exists(save_data, "game_completed")) 
		{ 
			global.game_completed = save_data[? "game_completed"];
		}
		// best time check
		if (ds_map_exists(save_data, "best_time"))
		{
			global.best_time = save_data[? "best_time"];
		}
		// least deaths check
		if (ds_map_exists(save_data, "least_deaths"))
		{
			global.least_deaths = save_data[? "least_deaths"];
		}
		// volume check
		if (ds_map_exists(save_data, "volume"))
		{
			global.volume = save_data[? "volume"];
		}
		
		ds_map_destroy(save_data);
	}
}

function FormatTime(argument0)
{
	var seconds = argument0 / ROOM_SPEED;
	
	var mins = floor(seconds / 60);
    var secs = floor(seconds mod 60);
    
    if (secs < 10) {
        return string(mins) + ":0" + string(secs);
    } else {
        return string(mins) + ":" + string(secs);
    }
}
















