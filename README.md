# DSMPi
Sparklerific set of scripts and such to run ECMLink on a Raspberry Pi, complete with bells, whistles, buttons, and oled screens

## To Install

For best results, drop to root.  Sudo should also be just dandy.

In Linux, run the following commands:
  cd /opt
  git clone https://github.com/kami-nashi/DSMPi.git
  cd DSMPi
  sh setup.sh
  
  
 ## Notes
   Set up sript will attempt to launch the link installer.  When it asks you what path ECMLink should go to, tell it /opt/ecmlink
   If you do not, other scripts/features may not work. Personally, I found this to be the best place to keep it and /opt is for 3rd party    software anyway.
   
   If any script appears not to run, throw a good ol' 'chmod +x' and try again. Permissions will typically shut these things down
   
   Due to my own ECU not able to be powered at the moment, I have no worked in the part of the scripts that sets baud rate.  Please reach    out to me directly if you need assistance with that - but it has to be done at launch to capture data.
