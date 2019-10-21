#!/usr/bin/env expect

spawn /tmp/dsm_rpi/ecmlink_3_36_73.sh -c

expect "This will install ECMLink on your computer."
send "o\r"
expect "Where should ECMLink be installed?"
send "/opt/ECMLink\r"
expect "Create symlinks?"
send "y\r"
expect "Select the folder where you would like ECMLink to create symlinks, then click Next."
send "/usr/local/bin\r"
expect "Create a desktop icon?"
send "n\r"
expect "Clear preferences?"
send "n\r"
expect "Run ECMLink?"
send "n\r"
