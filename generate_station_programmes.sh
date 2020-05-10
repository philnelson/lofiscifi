./generate_playlist_from_directory.sh /mnt/AUDIO_ANNEX/audio_sources/Dimension_X/ /mnt/AUDIO_ANNEX/audio_sources/Dimension_X/dimension_x.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/X_Minus_One/ /home/phil/oldtimeradio/audio_sources/X_Minus_One/x_minus_one.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/ /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/exploring_tomorrow.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/MindWebs/ /home/phil/oldtimeradio/audio_sources/MindWebs/mindwebs.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/Theater_Five/ /home/phil/oldtimeradio/audio_sources/Theater_Five/theater_five.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/2000_Plus/ /home/phil/oldtimeradio/audio_sources/2000_Plus/2000_plus.m3u
./generate_playlist_from_directory.sh /home/phil/oldtimeradio/audio_sources/Zero_Hour/ /home/phil/oldtimeradio/audio_sources/Zero_Hour/Zero_Hour.m3u

cat /home/phil/oldtimeradio/audio_sources/Theater_Five/theater_five.m3u /home/phil/oldtimeradio/audio_sources/MindWebs/mindwebs.m3u /home/phil/oldtimeradio/audio_sources/Exploring_Tomorrow/exploring_tomorrow.m3u /home/phil/oldtimeradio/audio_sources/X_Minus_One/x_minus_one.m3u /mnt/AUDIO_ANNEX/audio_sources/Dimension_X/dimension_x.m3u /home/phil/oldtimeradio/audio_sources/2000_Plus/2000_plus.m3u /home/phil/oldtimeradio/audio_sources/Zero_Hour/Zero_Hour.m3u > /home/phil/oldtimeradio/audio_sources/station_programmes.m3u