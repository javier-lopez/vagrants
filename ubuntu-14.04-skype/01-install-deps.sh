#!/bin/sh
dpkg --add-architecture i386
apt-get update
#apt-get install --no-install-recommends -y xvfb fluxbox x11vnc dbus libasound2 libqt4-dbus libqt4-network libqtcore4 libqtgui4 libxss1 libqt4-xml libaudio2 libmng1 fontconfig liblcms1 lib32stdc++6 lib32asound2 ia32-libs libc6-i386 lib32gcc1 vim-nox
apt-get install --no-install-recommends -y xvfb fluxbox x11vnc vim-nox gdebi xterm alsa-base linux-image-extra-$(uname -r)
#wget --progress=bar:force http://f.javier.io/rep/deb/apulse_20140925-1_amd64.deb
#dpkg -i apulse_20140925-1_amd64.deb
modprobe snd-dummy
echo snd-dummy >> /etc/modules
