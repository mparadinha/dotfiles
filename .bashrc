#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# to make termite's ctrl-shift-t work
source /etc/profile.d/vte.sh

# convenience aliases
alias lab="cd ~/college/lfea/bio; cls"
alias gl="cd ~/repos/opengl-game; cls"
alias vk="cd ~/projekts/vulkan; cls"
alias ray="cd ~/projekts/homemade-raytracer; cls"
alias cd-steam="cd ~/.local/share/Steam/steamapps/common; cls"

# use the colorgcc wrapper because ccache removes error colors
export PATH="/usr/lib/colorgcc/bin/:$PATH"
# tell ccache to only use compilers in this path
export CCACHE_PATH="/usr/bin"

# when starting python in interactive mode exec this file first
export PYTHONSTARTUP="/home/parada/.python_startup.py"

# make vim default editor
export EDITOR=/usr/bin/vim

# auto use vim in yaourt for reading files
export VISUAL="vim"

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --group-directories-first'
alias cls='clear && pwd && ll'
PS1='[\u@\h \W]\$ '

# muh' bloat measuring
alias lsize='du -sch .[!.]* * | sort -h'
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
alias kb="setxkbmap -layout"

# when you forget sudo you have to ask nicely
alias pls='sudo $(history -p !!)'

# to lazy to type this to get pretty commit logs from git
alias pretty-log="git log --graph --oneline --all --decorate"

alias net-change="sudo netctl stop-all && sudo netctl start"
alias net-start="sudo netctl start"
alias getip="wget -q canihazip.com/s -O -; printf '\n'"

# wine alias
alias wine-steam="WINEARCH=win32 WINEPREFIX=~/win32 wine ~/.wine/drive_c/'Program Files (x86)'/Steam/Steam.exe"

# make sure we're using ibus as the input framework for gtk and qt
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im-ibus
export QT_IM_MODULE=ibus

# misc
alias grep="grep --color=auto"
#alias dd="dd --status=progress"
alias hexdump="hexdump -C"
alias vim-hex="vim -c %!xxd"
alias root="root -l"
# resize images to fit on viewport
alias feh="feh -Z"
# set a random wallpaper
alias pape="ls ~/wallpapers | sort -R | tail -n 1 | sed 's/^/wallpapers\//' | xargs feh --bg-fill"
alias lstodo="grep TODO * -nr"
# update the .Xresources file
alias update-xres="vim ~/.Xresources; xrdb -merge ~/.Xresources"

alias htop="htop -d 10"

alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"


# play a twitch stream using mpv
function twitch() {
    streamlink https://twitch.tv/$1 best --player mpv
    #mpv --really-quiet https://twitch.tv/$1 "${@:2}"
}
