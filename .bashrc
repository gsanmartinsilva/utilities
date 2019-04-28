#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Define Aliases
alias ls='ls --color=auto'
alias hdd='cd /mnt/hdd'
alias v='vim'
alias dotf='cd repos/dotfiles'


#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;36m\]\h \w\[\e[1;31m\]]$ \[\e[m\]'
