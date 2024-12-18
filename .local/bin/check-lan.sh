#!/bin/sh

# cron script for checking wlan connectivity
# change 192.168.1.1 to whatever IP you want to check.
IP_FOR_TEST="192.168.0.1"
PING_COUNT=1
INTERFACE="wlan0"

FFLAG="/tmp/stuck.fflg"

# ping test
/bin/ping -c $PING_COUNT $IP_FOR_TEST > /dev/null 2> /dev/null
if [ $? -ge 1 ]
then
    logger "$INTERFACE seems to be down, trying to bring it up..."
        if [ -e $FFLAG ]
        then
                logger "$INTERFACE is still down, REBOOT to recover ..."
                rm -f $FFLAG 2>/dev/null
                sudo reboot
        else
                touch $FFLAG
                logger $(sudo /sbin/ip link set $INTERFACE down)
                sleep 10
                logger $(sudo /sbin/ip link set $INTERFACE up)
        fi
else
#    logger "$INTERFACE is up"
    rm -f $FFLAG 2>/dev/null
fi
