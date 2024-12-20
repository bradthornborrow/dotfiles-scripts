#!/bin/bash
#
# Purpose: Display the CPU and GPU temperature of Raspberry Pi 2/3
#
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo
echo "$(date +'%a %d %b %Y %H:%M:%S %Z') @ $(hostname)"
echo "-------------------------------------------"
if [ -f "/usr/bin/vcgencmd" ]; then
  echo " GPU $(vcgencmd measure_temp)"
fi
echo " CPU temp=$((cpu/1000))'C"
echo
