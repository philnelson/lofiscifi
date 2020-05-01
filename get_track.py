import json
import xml.etree.ElementTree as ET
import requests

url = "http://retrostrange.com:8000/lofiscifi-mp3.xspf"

output_data = {}
output_data['stream'] = "http://retrostrange.com:8000/lofiscifi-mp3"

icecast_xspf = requests.get(url)

if icecast_xspf.status_code == 200:
    xml_root = ET.fromstring(icecast_xspf.content)

    #print(xml_root[0].text)

    currently_playing = xml_root[2][0][1].text
    notes = xml_root[2][0][2].text.split('\n')
    num_listeners = "Current Listeners"

    print(currently_playing)

    print(notes[4][19:])

    output_data['currently_playing'] = currently_playing
    output_data['current_listeners'] = notes[4][19:]

    with open('/var/www/retrostrange.com/lofiscifi-status.json', 'w') as outfile:
        json.dump(output_data, outfile)
