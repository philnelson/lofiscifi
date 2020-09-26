import argparse
import ffmpeg
from internetarchive import get_item, download

parser = argparse.ArgumentParser(description='Download a single file from the internet archive and prepare it for streaming in OGG/AAC or VP9/H264')
parser.add_argument('item', help='Internet Archive identifier, e.g. Drive-inSaveFreeTv')

args = parser.parse_args()

requested_id = args.item

item = get_item(requested_id)

#{'mediatype': 'movies', 'collection': ['DriveInMovieAds', 'ephemera'], 'title': 'Drive-in: Save Free TV', 'description': 'about 47 seconds. suggestion; insert clip before "coming soon" clip when creating drive-in dvd', 'subject': 'drive-in;clip;tv', 'licenseurl': 'http://creativecommons.org/licenses/publicdomain/', 'identifier': 'Drive-inSaveFreeTv', 'uploader': 'ckguy@sbcglobal.net', 'addeddate': '2009-05-23 03:13:34', 'publicdate': '2009-05-23 03:16:42', 'backup_location': 'ia903603_5', 'creator': ''}

print(item.item_metadata['metadata']['title'])

download(requested_id, verbose=True, glob_pattern='*mp4')

