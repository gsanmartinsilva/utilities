
#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)
#
# Requirements:
# - rofi
# - systemd, but you can replace the commands for OpenRC or anything else
#
# Instructions:
# - Save this file as power.sh or anything
# - Give it exec priviledge, or chmod +x /path/to/power.sh
# - Run it

chosen=$(echo -e "[Cancel]\nShutdown\nReboot\nSuspend\n" | rofi -dmenu -i -l 4  -theme onedark.rasi)
# Info about some states are available here:
# https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html#Description


if [[ $chosen = "Shutdown" ]]; then
	chosen1=$(echo -e "No\nYes\n" | rofi -dmenu -i -l 2 -theme onedark.rasi)
	if [[ $chosen1 = "Yes" ]]; then
		systemctl poweroff
	fi
elif [[ $chosen = "Reboot" ]]; then
	chosen1=$(echo -e "No\nYes\n" | rofi -dmenu -i -l 2 -theme onedark.rasi)
	if [[ $chosen1 = "Yes" ]]; then
		systemctl reboot
	fi
elif [[ $chosen = "Suspend" ]]; then
	chosen1=$(echo -e "No\nYes\n" | rofi -dmenu -i -l 2 -theme onedark.rasi)
	if [[ $chosen1 = "Yes" ]]; then
		systemctl suspend
	fi
fi
