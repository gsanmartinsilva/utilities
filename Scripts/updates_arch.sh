#!/bin/sh

n_updates_arch=$(checkupdates 2> /dev/null | wc -l )
n_updates_aur=$(yay -Qum 2> /dev/null | wc -l)
updates_arch=$(checkupdates)
updates_aur=$(yay -Qum)

if  [[ $1 = "-n" ]]; then
    printf " $n_updates_arch + $n_updates_aur"
else
    str=$"Arch: $n_updates_arch\n$updates_arch\nAUR: $n_updates_aur\n$updates_aur"
    printf "$str"
fi

