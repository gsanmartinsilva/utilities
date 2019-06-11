#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Define Aliases
alias yt-audio='cd /media/hdd/Media && youtube-dl -x --audio-format mp3'
alias ls='ls --color=auto'
alias g='gedit'
alias nvidia-on='sudo tee /proc/acpi/bbswitch <<<ON'
alias nvidia-off='sudo tee /proc/acpi/bbswitch <<<OFF'
alias nvidia-status='cat /proc/acpi/bbswitch'
alias syu='sudo pacman -Syu'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # many commands in ongoing session memory
export HISTFILESIZE=100000              # many lines in .bash_history
export QT_QPA_PLATFORMTHEME=qgnomeplatform

#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;36m\]\h \w\[\e[1;31m\]]$ \[\e[m\]'

. /usr/bin/virtualenvwrapper.sh
