# First, make all extensions lowercase
find ${1} -name '*.*' -type f -exec bash -c 'base=${0%.*} ext=${0##*.} a=$base.${ext,,}; [ "$a" != "$0" ] && mv -- "$0" "$a"' {} \;
# Add to playlist
playlist=${2} ; if [ -f $playlist ]; then rm $playlist ; fi ; for f in ${1}*.mp3; do echo "$f" >> "$playlist"; done