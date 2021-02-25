#/bin/sh

# define the path/file of the ecmlink cable after udev changes are made
FILE=/dev/ttyUSB0

# if the cable is there, and udev rules worked, then set the speed.
if [ -f "$FILE" ]; then
    setserial /dev/ttyUSB0 baud_base 3000000 divisor 192 spd_cust
# otherwise, just exit with some informative text
else 
    echo "$FILE not found \n Cable may not be inserted or uDev rules may not yet be loaded. \n If you're sure the cable is present, try a reboot."
fi