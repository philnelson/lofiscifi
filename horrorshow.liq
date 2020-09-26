set("video.converter.preferred", "ffmpeg")

security = single("/home/phil/horrortv/video_sources/default.ogv")
source = playlist("/home/phil/horrortv/video_sources/movies/playlist.m3u")

clock.assign_new(sync=false,[source])

tv_feed = fallback([source, security])

output.icecast(
        %ogg(%theora(quality=50,width=624,height=352),%vorbis),
        host="localhost",
        port=8000,
        password="",
        mount="horrorshow-ogv",
        tv_feed)

output.icecast(
%ffmpeg(format="mpegts",
        %audio(codec="ac3",channel_coupling=0),
        %video(codec="libx264",b="2600k",
               "x264-params"="scenecut=0:open_gop=0:min-keyint=150:keyint=150",
               preset="ultrafast")),
host="localhost",
port=8000,
password="",
mount="horrorshow-mp4",
tv_feed)