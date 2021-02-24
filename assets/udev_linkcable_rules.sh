#/bin/sh

linkserial=`udevadm info -a -n /dev/ttyUSB0 | grep '{manufacturer}' | head -n1 | cut -d '"' -f2`

cat <<EOF > /etc/udev/rules.d/99-usb-serial.rules
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="$linkserial", SYMLINK+="ttyUSB98", OWNER="pi", GROUP="dialout", RUN+="/usr/bin/setserial /dev/ttyUSB98 baud_base 3000000 divisor 192 spd_cust"
EOF

## Lets tell Linux to set the baud rate of ttyUSB98 every time the cable is plugged in
## Based on input from https://www.dsmtuners.com/threads/raspberry-pi-running-ecmlink-on-headunit.476635/
## and
## https://unix.stackexchange.com/questions/28548/how-to-run-custom-scripts-upon-usb-device-plug-in
## KERNEL=="sd*", ATTRS{vendor}=="Yoyodyne", ATTRS{model}=="XYZ42", ATTRS{serial}=="123465789", RUN+="/pathto/script"
## setserial /dev/ttyUSB98 baud_base 3000000 divisor 192 spd_cust

chmod 644 /etc/udev/rules.d/99-usb-serial.rules
chown root:root /etc/udev/rules.d/99-usb-serial.rules

udevadm control –reload-rules
udevadm trigger /dev/ecmlink
