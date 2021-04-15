#!/bin/sh

logger -p local0.notice -t ${0##*/}[$$] "Setting ECMLink Cable usbTTY0 Baud Rate"

linkSet=$(setserial /dev/ttyUSB0 baud_base 3000000 divisor 192 spd_cust)

if $linkSet ; then
    logger -p local0.notice -t ${0##*/}[$$] "ECMLink Baud Rate Set Successfully"
else
    logger -p local0.notice -t ${0##*/}[$$] "Failed To Set ECMLink Baud Rate"
fi
