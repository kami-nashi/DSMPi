# DSMPi
Sparklerific set of scripts and such to run ECMLink on a Raspberry Pi, complete with bells, whistles, buttons, and oled screens

## To Install

For best results, Sudo should be just dandy.  Avoid using as root (or you may need to manually re-do some of the commands and unass permission issues)

In Linux, run the following commands:
```bash

    sudo mkdir /opt/github
    cd /opt/github/
    sudo git clone https://github.com/kami-nashi/DSMPi.git
    cd DSMPi
    sudo sh setup.sh
```  

 ## Notes
   Set up script will attempt to launch the link installer, which now has an answer file and will automatically install to /opt/ECMLink
   Personally, I found this to be the best place to keep it and /opt is for 3rd party software anyway.

   If any script appears not to run, throw a good ol' 'chmod +x' and try again. Permissions will typically shut these things down

   Due to my own ECU not able to be powered at the moment, I have no worked in the part of the scripts that sets baud rate.  Please reach out to me directly if you need assistance with that - but it has to be done at launch to capture data.
