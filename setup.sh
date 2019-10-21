#/bin/sh

# prepare basic tools
apt-get update
apt-get install git expect wget screen rsync terminator vim librxtx-java setserial xautomation unclutter xscreensaver openssh-server setserial librxtx-java

# git the DSMPi repo (for script assets)
mkdir /opt/github
cd /opt/github
git clone https://github.com/kami-nashi/DSMPi.git

# create work dirs
mkdir /tmp/dsm_rpi
cd /tmp/dsm_rpi

# get the packages we need
wget moddy.kami-nashi.com/dsm_rpi/sources/ecmlink_3_36_73.sh
wget moddy.kami-nashi.com/dsm_rpi/sources/jdk-8u221-linux-arm32-vfp-hflt.tar.gz
wget moddy.kami-nashi.com/dsm_rpi/sources/librxtxserial_2_1_7.so
wget moddy.kami-nashi.com/dsm_rpi/sources/RXTXcomm.jar

# get rid of openjdk because of reasons (ecmlink compatiblity issues)
apt-get purge openjdk*

# unzip java, install that crap
tar xvzf /tmp/dsm_rpi/jdk-8u221-linux-arm32-vfp-hflt.tar.gz -C /opt/
update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_221/bin/javac 1
update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_221/bin/java 1
update-alternatives --config javac
update-alternatives --config java

# install ECMLink
chmod +x /tmp/dsm_rpi/ecmlink_3_36_73.sh
/opt/github/DSMPi/assets/ecmlink_answers.sh

# Setup ECMLink/Java to use the ARM version of RXTX
# borrowed from http://www.ecmtuning.com/forums/showthread.php?t=78448&highlight=raspberry&page=4
cd /opt/ECMLink/libs/
cp /tmp/dsm_rpi/librxtxserial_2_1_7.so .
cp /tmp/dsm_rpi/RXTXcomm.jar .
ln -sf /usr/lib/jni/librxtxSerial.so
chmod +x ../ecmlink

# get powerline fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mv PowerlineSymbols.otf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

fc-cache -vf /usr/share/fonts/

# install raspberry pi stuff for things
pip3 install Adafruit_DHT
pip3 install Adafruit_Python_SSD1306

# create and clone additional dev resources
cd /opt/github

git clone https://github.com/adafruit/Adafruit_SSD1306.git
git clone https://github.com/adafruit/Adafruit_Python_DHT.git

#cp assets/systemd/status_checker.service /lib/systemd/system/status_checker.service
