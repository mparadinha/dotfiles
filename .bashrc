#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ls related commands
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --group-directories-first'
alias cls='clear && pwd && ll'
alias lsize='du -sch .[!.]* * | sort -h'
PS1='[\u@\h \W]\$ '

alias df='df -h'

# colors for ls output
eval "$(dircolors ~/.dircolors)"

# change keyboard layout with ease
alias setkb='setxkbmap -layout'

# color for grep
alias grep='grep --color=auto'

# auto use vim in yaourt for reading files
export VISUAL='vim'

# when you forget sudo you have to ask nicely
alias pls='sudo $(history -p !!)'

# to lazy to type this to get pretty commit logs from git
alias pretty-log="git log --graph --oneline"

alias net-change="sudo netctl stop-all && sudo netctl start"
alias getip="curl -s canihazip.com/s; printf '\n'"
