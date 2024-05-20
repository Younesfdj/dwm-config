#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

# Loop through all attached batteries and format the info
for battery in /sys/class/power_supply/BAT?*; do
	# If non-first battery, print a space separator.
	[ -n "${capacity+x}" ] && printf " "
	capacity="$(cat "$battery/capacity" 2>&1)"
	# Sets up the incharge
	if [ "$(cat "$battery/status" 2>&1)" = "Charging" ]; then
		incharge="🔌"
	fi
	if [ $capacity -le 100 ]; then
		status="󰁹"
		if [ $capacity -le 75 ]; then
			status="󰂀"
			if [ $capacity -le 50 ]; then
				status="󰁿"
				if [ $capacity -le 25 ]; then
					status="󰁻"
				fi
			fi
		fi
	fi
	
	# Will make a warn variable if discharging and low
	[ "$status" = "󰁻" ] && [ "$capacity" -le 25 ] && warn="❗"
	# Prints the info
	printf " %s%s%s %d%%" "$status" "$warn" "$incharge" "$capacity"; unset warn
done && printf " | "