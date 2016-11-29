#!/bin/sh
#wget --progress=bar:force --no-check-certificate http://f.javier.io/rep/deb/skype-ubuntu-precise_4.3.0.37-1_i386.deb -O skype-linux-beta.deb
wget  --progress=bar:force --no-check-certificate http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb -O skype-linux-beta.deb
gdebi -n skype-linux-beta.deb
useradd -m skype
wget  --progress=bar:force http://sprunge.us/IRYE -O /usr/bin/start-skype-server.sh
chmod +x /usr/bin/start-skype-server.sh

#TODO 25-06-2016 09:47 >> automatizate this
echo "login as 'skype' and run:"
echo
echo /usr/bin/start-skype-server.sh
echo x11vnc -wireframe  -forever -safer -shared -display :1
echo
echo "then use a vnc client to connect and start skype within the instance"
