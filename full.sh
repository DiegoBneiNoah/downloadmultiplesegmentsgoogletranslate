#!/bin/bash
grep -o 'https://translate.google.com/translate.*."' har.har > har1.har; awk -F, '{print "wget -q -U Mozilla -O .mp3 \""$1""}' har1.har > antepage.txt; awk -F, '{print "#!/bin/bash \n "$1" "$2""}' antepage.txt > page.sh; awk '/\.mp3/{sub(".mp3",++count"&")} 1'  page.sh > page.sh; chmod +x page.sh; export PATH=$PATH:$pwd; ls > x ; awk 'ORS=" "' x > x1; awk -F, '{print "#!/bin/bash \n cat "$1" "$2"> page.mp3"}' x1 > cat.sh ; chmod +x cat.sh; cat.sh
