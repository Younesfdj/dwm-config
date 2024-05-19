#!/bin/bash

# Volume state output
VOL=$(amixer get Master | awk 'NR==6 {print $5}' | sed 's/\[//;s/\]//;s/%//')
if [ "$VOL" -le 0 ]; then
    VOLSTATE="🔇"
elif [ "$VOL" -le 5 ]; then
    VOLSTATE="🔈"
elif [ "$VOL" -le 45 ]; then
    VOLSTATE="🔉"
else
    VOLSTATE="🔊"
fi

echo " ${VOL}% ${VOLSTATE} |"
