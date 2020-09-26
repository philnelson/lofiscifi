#!/usr/bin/liquidsoap

# Retrieve Secrets
%include "lofiscifi_config.liq"

# Log dir
set("log.file.path",log_file_path_and_filename)

# Programs
programmes = playlist(reload=600,"/home/phil/oldtimeradio/audio_sources/station_programmes.m3u")
# Some station idents
station_idents = playlist(reload=600,"/home/phil/oldtimeradio/audio_sources/station_idents/station_idents.m3u")
# Some promos
drop_ins = playlist(reload=600,"/home/phil/oldtimeradio/audio_sources/scifi_dropins/scifi_dropins.m3u")
# If something goes wrong, we'll play this
security = single("/home/phil/oldtimeradio/audio_sources/default.mp3")

# Add the programs and promos/commercials
radio = random(weights=[1,3,2],[ drop_ins, programmes, station_idents ])
# And finally the security
radio = fallback(track_sensitive = false, [radio, security])
# later if we want to add a sequential playlsit, e.g. a serialized show
# playlist(mode="normal", "/home/phil/oldtimeradio/audio_sources/some_serialized_thing.m3u")

radio_stereo = audio_to_stereo(radio)

# Stream it out
output.icecast(%mp3,
  host = "localhost", port = 8000,
  password = icecast_password, mount = "lofiscifi-mp3",
  radio_stereo)

output.icecast(%vorbis,
  host = "localhost", port = 8000,
  password = icecast_password, mount = "lofiscifi-ogg",
  radio_stereo)

