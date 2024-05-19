#!/bin/bash

# This is the wrapper script for all status bar functions, all contents are
# imported by the main function

main() {
# ./_wifi.sh ;
# ./_weather.sh;
# . /home/younes/.suckless/dwm/statusbar/_memory.sh ;
# . /home/younes/.suckless/dwm/statusbar/_cpu.sh ;
. /home/younes/.suckless/dwm/statusbar/_audio.sh ;
. /home/younes/.suckless/dwm/statusbar/_battery.sh ;
. /home/younes/.suckless/dwm/statusbar/_clock.sh ;
}

xsetroot -name "$(main | tr "\n" " ")"
