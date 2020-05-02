from os import walk
from mutagen.easyid3 import EasyID3
from mutagen.id3 import ID3NoHeaderError, ID3
from mutagen.mp3 import MP3
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("directory",help="Full path to directory with mp3s")
args = parser.parse_args()

audio_directory = args.directory

f = []
total_missing = 0

for (dirpath, dirnames, filenames) in walk(audio_directory):
    f.extend(filenames)
    break

for file in f:
    if file.lower().endswith('.mp3'):
        try:
            audio = EasyID3("{}/{}".format(audio_directory,file))
        
            title = audio.get('title', None)
            artist = audio.get('artist', None)

            if title is None:
                print("{} has no title attribute.".format(file))

            if artist is None:
                print("{} has no artist attribute.".format(file))
                
            if title or artist is None:
                total_missing+=1

        except ID3NoHeaderError:
            print("{} has no ID3 tags. Saving blank ones to it.".format(file))
            audio = MP3("{}/{}".format(audio_directory,file))
            audio.add_tags()
            
            # Save blank ID3 tags to broken file
            audio.save("{}/{}".format(audio_directory,file))
            break

print("{} files missing ID3 tags".format(total_missing))