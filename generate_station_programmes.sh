./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/Dimension_X/ /home/phil/oldtimeradio/audio_sources/Dimension_X/dimension_x.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/X_Minus_One/ /home/phil/oldtimeradio/audio_sources/X_Minus_One/x_minus_one.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/ /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/exploring_tomorrow.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/MindWebs/ /home/phil/oldtimeradio/audio_sources/MindWebs/mindwebs.m3u

cat /home/phil/oldtimeradio/audio_sources/MindWebs/mindwebs.m3u /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/exploring_tomorrow.m3u /home/phil/oldtimeradio/audio_sources/X_Minus_One/x_minus_one.m3u /home/phil/oldtimeradio/audio_sources/Dimension_X/dimension_x.m3u > /home/phil/oldtimeradio/audio_sources/station_programmes.m3u