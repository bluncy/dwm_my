5#!/bin/bash

/bin/bash ~/dwm_my/scripts/dwm-status.sh &
/bin/bash ~/dwm_my/scripts/wp-autochange.sh &
#picom -o 0.95 -i 0.88 --detect-rounded-corners --vsync --blur-background-fixed -f -D 5 -c -b
picom -b
/bin/bash ~/dwm_my/scripts/tap-to-click.sh &
/bin/bash ~/dwm_my/scripts/inverse-scroll.sh &
#/bin/bash ~/dwm_my/scripts/setxmodmap-colemak.sh &
#nm-applet &
fcitx5 &
#xfce4-power-manager &
#xfce4-volumed-pulse &
/bin/bash ~/dwm_my/scripts/run-mailsync.sh &
~/dwm_my/scripts/autostart_wait.sh &
