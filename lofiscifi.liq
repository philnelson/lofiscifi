#!/usr/bin/liquidsoap
# Log dir
set("log.file.path","/home/phil/oldtimeradio/lofiscifi-liq.log")

# Programs
programmes = playlist("/home/phil/oldtimeradio/audio_sources/station_programmes.m3u")
# Some station idents
station_idents = playlist("/home/phil/oldtimeradio/audio_sources/station_idents/station_idents.m3u")
# Some promos
drop_ins = playlist("/home/phil/oldtimeradio/audio_sources/scifi_dropins/scifi_dropins.m3u")
# If something goes wrong, we'll play this
security = single("/home/phil/oldtimeradio/audio_sources/default.mp3")

# Start building the feed with music
radio = programmes
# Now add some jingles
radio = random(weights=[1,1,5],[ station_idents, drop_ins, radio ])
# And finally the security
radio = fallback(track_sensitive = false, [radio, security])

radio_stereo = audio_to_stereo(radio)

# Stream it out
output.icecast(%mp3,
  host = "localhost", port = 8000,
  password = "", mount = "lofiscifi-mp3",
  radio_stereo)

output.icecast(%vorbis,
  host = "localhost", port = 8000,
  password = "", mount = "lofiscifi-ogg",
  radio_stereo)

