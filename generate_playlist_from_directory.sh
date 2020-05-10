playlist=${2} ; if [ -f $playlist ]; then rm $playlist ; fi ; for f in ${1}*.mp3; do echo "$f" >> "$playlist"; done
playlist=${2} ; for f in ${1}*.Mp3; do echo "$f" >> "$playlist"; done