
if (!global.half_way)
{

	if (audio_is_playing(song_2)) audio_sound_gain(song_2, 0, 2500);
	if (!audio_is_playing(song_1))
	{
		current_song = audio_play_sound(song_1, 2, false);
	}
}
else
{
	if (audio_is_playing(song_1)) audio_sound_gain(song_1, 0, 2500);
	if (!audio_is_playing(song_2))
	{
		audio_play_sound(song_2, 2, false);
	}
}
