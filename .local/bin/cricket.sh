#!/bin/bash

dirname=`dirname "$0"`

# To enable GPIO audio on pin 18 add device tree
# overlay to /boot/firmware/config.txt
#
# dtoverlay=audremap,pins_18_19

# Set volume to 75%
amixer -M set PCM 75% > /dev/null

if [ $RANDOM -le 8192 ]; then
	aplay $dirname/cricket.wav
fi
