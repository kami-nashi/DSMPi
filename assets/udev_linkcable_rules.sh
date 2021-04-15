#!/bin/sh

## Lets tell Linux to set the baud rate of ttyUSB98 every time the cable is plugged in
## Based on input from https://www.dsmtuners.com/threads/raspberry-pi-running-ecmlink-on-headunit.476635/
## and
## https://unix.stackexchange.com/questions/28548/how-to-run-custom-scripts-upon-usb-device-plug-in

cat <<EOF > /etc/udev/rules.d/99-usb-serial.rules

SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{manufacturer}=="ECMTuning", SYMLINK+="ttyUSB98", OWNER="pi", GROUP="dialout", ENV{HOME}="/home/pi", RUN+="/opt/DSMPi/assets/setECML_baud.sh"

EOF

## Lock down the permissions on the rules
chmod 644 /etc/udev/rules.d/99-usb-serial.rules
chown root:root /etc/udev/rules.d/99-usb-serial.rules

## Trigger the uDev rule update
udevadm trigger /dev/ttyUSB0
