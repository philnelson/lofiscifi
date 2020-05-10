import os
import requests
from bs4 import BeautifulSoup
import re
import argparse
from urllib.parse import urlparse

parser = argparse.ArgumentParser()
parser.add_argument(
    "url", help="Full URL to page containing files to download.")
parser.add_argument("directory", help="Full path to output directory")
parser.add_argument(
    "extension", help="File extension (without leading dot '.')")
args = parser.parse_args()

url = args.url
url_parts = urlparse(url)
output_directory = args.directory
extension = args.extension
files_downloaded = 0

r = requests.get(url)
soup = BeautifulSoup(r.text, 'html.parser')


for link in soup.find_all('a', href=True):
    href = link.get("href")
    
    # Lose anchors to local files
    file_url = None
    if href[-(len(extension)+1):] == f'.{extension}':
        #print(len(extension))
        #print(href[:4])
        if href[:4] == "http":
            file_url = href
        else:
            #print("No HTTP")
            file_url = f"{url_parts.scheme}://{url_parts.netloc}{url_parts.path}/{href[-len(extension):]}"

        file_parts = urlparse(file_url)
        #print(file_parts)
        print(f"Downloading File {file_url}")
        download = requests.get(file_url)
        if download.status_code == 200:
            with open(f'{output_directory}/{os.path.basename(file_parts.path)}', 'wb') as f:
                f.write(download.content)

            files_downloaded += 1
        else:
            print(f"Download Failed For File {file_url}")
    else:
       #print("Too spicy.")
        pass

print(f'Downloaded {files_downloaded} files to {output_directory}.')
