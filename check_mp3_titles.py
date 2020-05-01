from os import walk
from mutagen.easyid3 import EasyID3

prefix = "/home/phil/oldtimeradio/audio_sources/Dimension_X"

f = []
for (dirpath, dirnames, filenames) in walk(prefix):
    f.extend(filenames)
    break

for file in f:
    audio = EasyID3("{}/{}".format(prefix,file))
    
    title = audio.get('title', None)

    if title is None:
        print(file)
        break

    #audio.save()