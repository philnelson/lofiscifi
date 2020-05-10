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

r = requests.get(url)
soup = BeautifulSoup(r.text, 'html.parser')


for link in soup.find_all('a', href=True):
    href = link.get("href")
    #print(url_parts)
    # Lose anchors to local files
    if href[-3:] == extension:
        if href[:4].lower not in ["http"]:
            file_url = f"{url_parts.scheme}://{url_parts.netloc}{url_parts.path}/{href[:-3]}{extension}"
        else:
            file_url = f"{href[:-3]}{extension}"

        print(f"Downloading File {file_url}")
        download = requests.get(f'{file_url}')
        if download.status_code == 200:
            with open(f'{output_directory}/{href[:-3]}{extension}', 'wb') as f:
                f.write(download.content)
        else:
            print(f"Download Failed For File {file_url}")
    else:
       #print("Too spicy.")
        pass
