xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96


#load xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources


exec i3

