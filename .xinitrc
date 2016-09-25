setxkbmap -layout pt
# enable keybinds for Fn and whatnot
xbindkeys
feh --bg-scale ~/wallpapers/arch-logo-red.png
# start with backlight at 35%
xbacklight -set 25
# correct mouse scrolling
xinput set-button-map 12 1 2 3 5 4 6 7 8 9 10 11 12

exec i3

