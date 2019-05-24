#!/bin/sh


name=$(playerctl --player=spotify metadata title)
artist=$(playerctl --player=spotify metadata artist)
state=$(playerctl --player=spotify status)

if  [[ $state == *"Playing"* ]]; then
    str_state=$""
elif [[ $state == *"Paused"* ]]; then
    str_state=$""
fi

printf "$str_state $name"