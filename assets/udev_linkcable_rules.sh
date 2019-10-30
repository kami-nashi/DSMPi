#/bin/sh

linkserial=`udevadm info -a -n /dev/ttyUSB0 | grep '{serial}' | head -n1 | cut -d '"' -f2`

cat <<EOF > /etc/udev/rules.d/99-usb-serial.rules
SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="$linkserial", SYMLINK+="ecmlink", OWNER="pi", GROUP="dialout"
EOF

chmod 644 /etc/udev/rules.d/99-usb-serial.rules
chown root:root /etc/udev/rules.d/99-usb-serial.rules

udevadm control –reload-rules
udevadm trigger /dev/ecmlink
