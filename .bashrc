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

alias df="df -h"
alias pacgraph="pacgraph -s" # only produce the svg
# print top $1 packages ($1 is first argument after command)
function pkgstats () {
    if [ "$1" != "" ]; then
        # the +1 is of the last (total size) line
        pacgraph -c | tail -n +9 | head -n $[$1 + 1] | tac;
    else
        pacgraph -c | tail -n +9 | tac;
    fi
}

# colors for ls output
eval "$(dircolors ~/.dircolors)"

# change keyboard layout with ease
alias setkb='setxkbmap -layout'

# color for grep
alias grep="grep --color=auto"

# auto use vim in yaourt for reading files
export VISUAL="vim"

# when you forget sudo you have to ask nicely
alias pls='sudo $(history -p !!)'

# to lazy to type this to get pretty commit logs from git
alias pretty-log="git log --graph --oneline"

alias net-change="sudo netctl stop-all && sudo netctl start"
alias net-start="sudo netctl start"
alias getip="curl -s canihazip.com/s; printf '\n'"

# wine alias
alias wine-steam="wine ~/.wine/drive_c/'Program Files (x86)'/Steam/Steam.exe"
