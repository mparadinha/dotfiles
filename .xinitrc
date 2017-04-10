setxkbmap -layout pt

# enable keybinds for Fn and whatnot
xbindkeys

# set the delay when holding down a key to be a bit faster
xset r rate 200 25

feh --bg-fill ~/wallpapers/beijing_smog.jpg

# start with backlight at 20%
xbacklight -set 20

# correct mouse scrolling
#xinput set-button-map 12 1 2 3 5 4 6 7 8 9 10 11 12

# i think this enables scrolling with the red nipple
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5

exec i3
