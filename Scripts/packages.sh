
#!/bin/bash
# Simple script to save in a file named "packages.txt" a list of all the packages installed
# in the system (pacman and yay) explicitly.


comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq) >> packages.txt