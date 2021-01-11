#!/bin/bash
print_mem(){
	memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$memfree"
}

print_temp(){
	test -f /sys/class/thermal/thermal_zone0/temp || return 0
	echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)C
}

show_record(){
	test -f /tmp/r2d2 || return
	rp=$(cat /tmp/r2d2 | awk '{print $2}')
	size=$(du -h $rp | awk '{print $1}')
	echo " $size $(basename $rp)"
}


LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"

#. "$DIR/dwmbar-functions/dwm_transmission.sh"
#. "$DIR/dwmbar-functions/dwm_cmus.sh"
#. "$DIR/dwmbar-functions/dwm_resources.sh"
#. "$DIR/dwmbar-functions/dwm_battery.sh"
#. "$DIR/dwmbar-functions/dwm_mail.sh"
#. "$DIR/dwmbar-functions/dwm_backlight.sh"
. "$DIR/dwmbar-functions/dwm_alsa.sh"
. "$DIR/print_bat.sh"
. "$DIR/print_date.sh"
. "$DIR/print_vel.sh"
#. "$DIR/print_volume.sh"
#. "$DIR/dwmbar-functions/dwm_pulse.sh"
#. "$DIR/dwmbar-functions/dwm_weather.sh"
#. "$DIR/dwmbar-functions/dwm_vpn.sh"
#. "$DIR/dwmbar-functions/dwm_network.sh"
#. "$DIR/dwmbar-functions/dwm_keyboard.sh"
#. "$DIR/dwmbar-functions/dwm_ccurse.sh"
#. "$DIR/dwmbar-functions/dwm_date.sh"

xsetroot -name "💿 $(print_mem)M$(print_vel)$(dwm_alsa) [ $(print_bat) ]$(show_record) $(print_date)" 
#xsetroot -name "💿 $(print_mem)M⬇️ $vel_recv⬆️ $vel_trans$(dwm_alsa) [ $(print_bat) ]$(show_record) $(print_date)"
#echo "💿 $(print_mem)M⬇️ $vel_recv⬆️ $vel_trans$(dwm_alsa) [ $(print_bat) ]$(show_record) $(print_date)"

exit 0
